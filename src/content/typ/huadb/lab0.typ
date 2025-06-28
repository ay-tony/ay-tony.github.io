#import "../../templates/post.typ": *

#show: post.with(
  title: "数据库实验 0. 概述",
  pub_date: (2025, 6, 28),
  upd_date: (2025, 6, 28),
  pub_time: (9, 20, 58),
  tags: ("数据库",),
  description: "",
)

= 课程

最近学习数据库，参考了清华大学《数据库管理系统》的在线课程、文档及实验资源。课程官网见#link("https://dbgroup.cs.tsinghua.edu.cn/ligl/courses_cn.html")[此处]。开启本系列记录一下完成的实验。

= 源码

实验的源码在 #link("https://github.com/thu-db/huadb")[Github]，先 fork 到#link("https://github.com/ay-tony/huadb")[自己的仓库]后 clone 下来。整体源码的框架结构已经搭建完成，需要个人跟随课程的进度进行关键代码的补全。

= 环境调试

- CMake 构建时报错（本地版本 `4.0.3`）：配置文件版本低于 3.5，直接把根目录和所有 `third_party` 下的 `CMakeLists.txt` 第一行版本改到高于 `3.5` 即可。

- 项目基于 C++17 编写，但是编译时出现警告，使用的 `wstring_convert` 在 C++17 中弃用，如果不想看警告可以在 `CMakeLists.txt` 中加上编译选项 `add_compile_options(-Wno-deprecated-declarations)` 把这个警告关掉。

- 我在完成项目的时候使用部分新版 C++ 语法糖，在 `CMakeLists.txt` 中加上编译选项 `add_compile_options(-Wno-c++26-extensions -Wno-c++23-extensions -Wno-c++20-extensions)` 来去除警告。

- 项目默认生成了 `compile_commands.json` 供 LSP 解析，我修改 `Makefile` 让每次构建的时候把生成的 `build/debug/compile_commands.json` 拷贝到根目录，同时在 `.gitignore` 里面加上这个文件。

