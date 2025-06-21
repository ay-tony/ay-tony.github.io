#import "@preview/physica:0.9.4": *

#let ex(it) = html.elem(
  "div",
  attrs: (
    style: "margin: 1rem 0; background-color: color-mix(in srgb, var(--bg1-color), var(--bg2-color)); padding: 10px 20px; border-radius: 10px",
  ),
)[
  #html.elem("p", attrs: (style: "text-indent: 0; margin-top: 0;"))[*练习*]
  #par(it)
]
#let pf(it) = html.elem("div", attrs: (style: "margin: 1rem 0; margin-top: 0;"))[
  #html.elem("p", attrs: (style: "text-indent: 0;"))[*证明*]
  #par(emph(it))
]

#let scr(it) = text(features: ("ss01",), $cal(it)$)
#let cate(it) = $upright(sans(#it))$
#let sA = $scr("A")$
#let sB = $scr("B")$
#let sC = $scr("C")$
#let sF = $scr("F")$
#let sG = $scr("G")$
#let sH = $scr("H")$
#let sN = $scr("N")$
#let sR = $scr("R")$
#let sS = $scr("S")$
#let sL = $scr("L")$
#let sl = $scr("l")$
#let vI = $vb(I)$
#let vx = $vb(x)$
#let vy = $vb(y)$
#let vz = $vb(z)$
#let uE = $upright(E)$
#let uM = $upright(M)$
#let cC = $cate(C)$
#let cL = $cate(L)$
#let LHS = math.class("normal", "LHS")
#let RHS = math.class("normal", "RHS")
#let var = math.class("unary", "var")
#let Ob = math.class("unary", "Ob")
#let Mor = math.class("unary", "Mor")
#let Hom = math.class("unary", "Hom")
#let Aut = math.class("unary", "Aut")
#let End = math.class("unary", "End")
#let circ = math.class("binary", sym.circle.tiny)
#let pm = sym.plus.minus

#let cases(..args) = math.cases(..args.pos().map(math.display), ..args.named())

#let math-abbr(body) = {
  show sym.lt.eq: sym.lt.eq.slant
  show sym.gt.eq: sym.gt.eq.slant
  show sym.dots: sym.dots.c


  body
}

#let post(
  title: "无标题文章",
  pub_date: (2000, 1, 1),
  upd_date: (2000, 1, 1),
  description: "",
  tags: ("杂项",),
  pub_date_key: 0,
  it,
) = {
  [
    #metadata((
      title: title,
      pub_date: datetime(year: pub_date.at(0), month: pub_date.at(1), day: pub_date.at(2)).display(),
      upd_date: datetime(year: upd_date.at(0), month: upd_date.at(1), day: upd_date.at(2)).display(),
      description: description,
      pub_date_key: (
        datetime(year: pub_date.at(0), month: pub_date.at(1), day: pub_date.at(2))
          - datetime(year: 2000, month: 1, day: 1)
      ).days(),
      tags: tags,
    ))<frontmatter>
  ]

  show: math-abbr

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

