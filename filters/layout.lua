local colbreak_before = {
  ["Sel"] = true,
}

function Header(el)
  if el.level ~= 1 then
    return nil
  end

  local text = pandoc.utils.stringify(el.content)
  if colbreak_before[text] then
    return {
      pandoc.RawBlock("typst", "#colbreak()"),
      el,
    }
  end

  return nil
end
