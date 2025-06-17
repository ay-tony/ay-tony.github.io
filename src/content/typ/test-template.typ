#import "../templates/post.typ": *

#show: post.with(
  title: "对于 Typst 模板的测试",
  pub_date: (2025, 6, 17),
  upd_date: (2025, 6, 17),
)

= Heading 1

== Heading 1.1

#lorem(50)

== Heading 1.2 测试

#figure(image("img/2025-06-17-18-00-48.png"), caption: [测试图像])
