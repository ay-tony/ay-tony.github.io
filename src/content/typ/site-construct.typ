#import "../templates/post.typ": *

#show: post.with(
  title: "本网站的构建及部署",
  pub_date: (2025, 6, 18),
  upd_date: (2025, 6, 18),
  tags: ("网站构建",),
  description: "",
)

= 网站构建

网站采用 `astro` 框架（https://docs.astro.build/zh-cn/getting-started/），同时采用了 `astro-typst` 集成（https://github.com/OverflowCat/astro-typst）来通过 `typst` 直接生成静态网页。

= 部署

网站部署在 Github Pages 上，利用 Cloudflare DNS 将域名重定向至 Github Pages.

+ 将域名 `example.cn` 的名称服务器更改为 Cloudflare。腾讯云可以在 `域名注册` 里面更改域名的名称服务器，这里更改名称服务器后可能需要等待较长时间，我等待了十几个小时来生效；
+ （可选）在 Github 个人设置里面验证给定的顶级域名 `example.cn`，提升域名安全性；
+ 在 Github Pages 中填写要绑定的域名（`example.cn` 或 `www.example.cn`），在 Cloudflare 里把要绑定的域名（`example.cn` 和 `www.example.cn`）的 `CNAME` 记录指向 Github Pages。根据 https://www.myriad-dreamin.com/zh/article/domain-setup/ ，应当把记录设置为“仅DNS”。
+ 此时通过 `example.cn` 或 `www.example.cn` 均可以访问到网页内容，并且自动重定向到 Github Pages 里面填写的绑定的域名。

实测境内网络可以访问。
