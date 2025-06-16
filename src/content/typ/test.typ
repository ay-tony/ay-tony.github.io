#metadata((
  title: "Test page",
  author: "Neko",
  desc: [$oo$ fun with `math`],
  date: datetime(
    year: 2024,
    month: 8,
    day: 7,
  ).display(),
  tags: ("测试1", "测试2"),
))<frontmatter>

#show math.equation: html.frame
#show math.equation.where(block: true): html.elem.with(
  "div",
  attrs: (style: "text-align:center;"),
)
#show math.equation.where(block: false): html.elem.with(
  "span",
  attrs: (style: "display: inline-block;"),
)
#set image(width: 30em)
#show image: html.frame
#show image: html.elem.with(
  "div",
  attrs: (style: "text-align:center;"),
)

#lorem(10)

test typst $integral.dash_omega f$ #lorem(10)

`test raw code`

```cpp
#include <cstdio>

int main(){
}
```

123

$ integral.dash_omega f $
<<<<<<< HEAD
=======

#figure(image("img/2025-06-16-08-44-28.png"))
>>>>>>> dev
