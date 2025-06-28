#import "../templates/post.typ": *

#show: post.with(
  title: "使用 Cloudflare 自定义邮箱域名和地址",
  pub_date: (2025, 6, 27),
  upd_date: (2025, 6, 28),
  pub_time: (13, 46, 5),
  tags: ("杂项",),
  description: "",
)

= 功能概述

在已经持有一个域名 `example.com` 的情况下，可以设置 Cloudflare 邮箱路由，将所有发到 `xxx@example.com` 的邮件全部转发到指定邮箱。这样对于不同平台的邮箱绑定可以设置不同邮箱，如 Steam 平台直接绑定 `steam@example.com`。在 Cloudflare 中更换转发邮箱，就可以实现一键更换绑定的邮箱。

= 过程

+ 首先要持有一个域名，且其 DNS 服务器设置在 Cloudflare 下解析，也就是把 DNS 名称服务器修改为 Cloudflare 指定的服务器。

+ 在 Cloudflare 中进入该域的界面，在左侧 `电子邮件 > 电子邮件路由` 界面中开启电子邮件路由。

+ 如果是默认转发（即把所有发送到 `xxx@example.com` 的邮件全部转发到同一个邮箱，而不是根据名称的不同而转发到不同的邮箱）可以直接跳过引导，然后在 `目标地址` 下面验证对应的邮箱，在 `路由规则` 下面把 `Catch-all` 地址编辑好并开启即可。

+ 如果对若干名称有特殊设定，可以在引导中直接设定，或者跳过引导然后在 `转发规则 > 自定义地址` 下进行添加。

= 其他

国际邮箱肯定可以，实测 qq 邮箱可以，校园邮箱也可以，注意关闭垃圾邮件识别，有可能把 Cloudflare 的验证邮件自动拦截掉。

