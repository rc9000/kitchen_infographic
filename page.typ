#set page(
  width: 297mm,
  height: 210mm,
  margin: (top: 29mm, bottom: 8mm, x: 8mm),
  numbering: none,
  columns: 2,
  header-ascent: 0pt,
  header: [
    #let ink = rgb("#263238")
    #let copper = rgb("#b65f32")
    #let flour = rgb("#fffdf8")
    #let chef-hat() = box(width: 23mm, height: 13mm)[
      #place(dx: 3mm, dy: 1mm, circle(radius: 4.8mm, fill: flour, stroke: 0.8pt + copper))
      #place(dx: 8mm, dy: -1mm, circle(radius: 5.3mm, fill: flour, stroke: 0.8pt + copper))
      #place(dx: 14mm, dy: 1mm, circle(radius: 4.8mm, fill: flour, stroke: 0.8pt + copper))
      #place(dx: 3mm, dy: 5mm, rect(width: 16mm, height: 7mm, fill: flour, stroke: 0.8pt + copper, radius: 1.2mm))
      #place(dx: 5mm, dy: 8.3mm, line(length: 12mm, stroke: 0.6pt + rgb("#e2b58e")))
    ]
    #grid(
      columns: (1fr, auto),
      column-gutter: 7mm,
      align: horizon,
      [
        #text(size: 21pt, weight: "bold", fill: ink)[Les Kitchen Facts]
        #v(-1pt)
        #text(size: 7.8pt, fill: copper)[Températures, ratios et repères à garder sous la main]
      ],
      chef-hat(),
    )
    #v(2.5pt)
    #line(length: 100%, stroke: 1.2pt + copper)
  ],
)
