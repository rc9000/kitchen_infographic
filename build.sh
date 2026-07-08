#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TOOLS_DIR="$ROOT/.tools"
QUARTO_DIR="$TOOLS_DIR/quarto"
QUARTO_BIN="$QUARTO_DIR/bin/quarto"
DIST_DIR="$ROOT/dist"
OUTPUT_PDF="facts_fr.pdf"

install_quarto() {
  mkdir -p "$TOOLS_DIR"

  local asset_url
  asset_url="$(
    curl -fsSL https://api.github.com/repos/quarto-dev/quarto-cli/releases/latest |
      sed -n 's/.*"browser_download_url": "\(.*quarto-.*-linux-amd64\.tar\.gz\)".*/\1/p' |
      head -n 1
  )"

  if [[ -z "$asset_url" ]]; then
    echo "Could not find a Linux amd64 Quarto release asset." >&2
    exit 1
  fi

  local archive
  archive="$TOOLS_DIR/quarto.tar.gz"

  echo "Installing Quarto from $asset_url"
  curl -fL "$asset_url" -o "$archive"
  rm -rf "$QUARTO_DIR"
  mkdir -p "$QUARTO_DIR"
  tar -xzf "$archive" -C "$QUARTO_DIR" --strip-components=1
  rm -f "$archive"
}

if [[ ! -x "$QUARTO_BIN" ]]; then
  install_quarto
fi

mkdir -p "$DIST_DIR"
rm -f "$DIST_DIR/infographic.pdf"

"$QUARTO_BIN" render "$ROOT/infographic.qmd" \
  --to typst \
  --output "$OUTPUT_PDF" \
  --output-dir "$DIST_DIR"

echo "Wrote $DIST_DIR/$OUTPUT_PDF"
