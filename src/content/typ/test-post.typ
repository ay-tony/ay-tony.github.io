#import "../templates/post.typ": *

#show: post.with(
  title: "测试文章",
  pub_date: (2025, 6, 17),
  upd_date: (2025, 6, 18),
)

```rust
pub fn main() {
    println!("Hello, world!");
}
```

#lorem(10)

test normal

*test strong*

_test emphasis_

`test raw`

https://www.solitairemiya.cn

= Test Heading

- test item

+ test item

#lorem(100)

/ Test: #lorem(50)
/ Test2: #lorem(50)
/ Test111: #lorem(50)

'test': "smart quote"

test symbol ~~~ ---

#quote[
  测试 引用
]

test typst $integral.dash_omega f$ #lorem(10)

$integral.dash_omega f$ #lorem(10)

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

#text(features: ("ss01",), box($cal(A)$))

#scr("A")

$
  cC sA sB sF sG I circ Ob pm scr("A") cal("A") scr("l") "ACDDD" #text(features: ("ss01",), $cal(A)$) B B
$

#ex[
  测试12345
]

#pf[
  证明12345
]
