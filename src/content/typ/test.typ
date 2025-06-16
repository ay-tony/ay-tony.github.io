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
  attrs: (style: "display:inline-block;"),
)
#show image: html.frame
#show image: html.elem.with(
  "div",
  attrs: (style: "display:flex; justify-content:center;"),
)

#lorem(10)

test normal

*test strong*

_test emphasis_

`test raw`

https://www.solitairemiya.cn

= Test Heading

- test item

+ test item

/ Test: #lorem(50)

'test': "smart quote"

test symbol ~~~ ---

#quote[
  测试 引用
]

test typst $integral.dash_omega f$ #lorem(10)

`test raw code`

```cpp
#include <cstdio>

int main(){
  int aaaaa = 1;
}
```

123

$ integral.dash_omega f $

#figure(image("img/2025-06-16-08-44-28.png"), caption: [测试标题])<fig:test>

@fig:test
