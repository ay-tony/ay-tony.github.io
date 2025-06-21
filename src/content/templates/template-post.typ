#import "../templates/post.typ": *

#show: post.with(
  title: "",
  pub_date: (%d, %d, %d),
  upd_date: (%d, %d, %d),
  pub_time: (%d, %d, %d),
  tags: ("杂项",),
  description: "",
)

