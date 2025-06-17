#let post(
  title: "无标题文章",
  pub_date: (2000, 1, 1),
  upd_date: (2000, 1, 1),
  description: "",
  tags: ("杂项",),
  it,
) = {
  [
    #metadata((
      title: title,
      pub_date: datetime(year: pub_date.at(0), month: pub_date.at(1), day: pub_date.at(2)).display(),
      upd_date: datetime(year: upd_date.at(0), month: upd_date.at(1), day: upd_date.at(2)).display(),
      description: description,
      tags: tags,
    ))<frontmatter>
  ]

  set text(size: 14pt, lang: "zh", region: "CN")
  show math.equation: html.frame
  show math.equation.where(block: true): html.elem.with(
    "div",
    attrs: (style: "text-align:center;"),
  )
  show math.equation.where(block: false): html.elem.with(
    "span",
    attrs: (style: "display:inline-block; text-indent:0;"),
  )
  show image: html.frame
  show image: html.elem.with(
    "div",
    attrs: (style: "display:flex; justify-content:center; border-radius:10px; overflow:hidden;"),
  )

  it
}

