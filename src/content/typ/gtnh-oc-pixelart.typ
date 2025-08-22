#import "../templates/post.typ": *

#show: post.with(
  title: "在 GTNH 中使用 Opencomputers 模组打印像素画",
  pub_date: (2025, 8, 14),
  upd_date: (2025, 8, 14),
  pub_time: (20, 17, 19),
  tags: ("我的世界", "GTNH", "Opencomputers", "OC", "像素画"),
  description: "",
)

= 准备并处理图片文件

+ 选定一张图片，将其大小的长、宽调整为 16 的倍数，且格式为 `.png`。打印完成后每个方块都是 16x16
  像素大小，所以要保证图片长、宽为完整的方块。
+ 从 http://phychi.com/gt/3d/printer.exe （可执行文件）或
  http://phychi.com/gt/3d/printer.java （源码）处获取转换工具 `printer.exe`。
+ 将图片命名为 `toprint.png`，并和转换工具 `printer.exe`
  共同放在桌面上（经实验，其它路径可能无效），双击启动转换工具 `printer.exe`。
+ 转码后的图片信息已经在剪贴板中，可以将其粘贴到任意文件。

= 准备 OC 系统及程序

+ 在存档中建立一个能够运行的 `OC` 电脑，测试在全 T3
  组件可以运行，其它配置未测试。需要连接一台充足变色材料和墨盒的 3D 打印机。视情况添加因特网卡以从网上获取相关资源。
+ 从 `http://phychi.com/gt/3d/printer.lua`
  处获得程序代码 `printer.lua`，或者从本文中拷贝程序代码。本文中的代码较原作者做了部分修改。

= 打印像素画

+ 将待处理图片文件 `example.txt` 保存到 OC 中，并与 `printer.lua`
  放在同一目录下。此处 `example.txt` 名称可以任意选取。
+ 运行命令 `printer /home/example.txt 'example'` 命令，其中 `/home/example.txt`
  替换为待处理的图片绝对路径，`'example'` 替换为希望打印出的像素画的物品名称。
+ 等待 3D 打印机逐个打印出像素画。像素画的顺序是从上到下、从左到右。

= 打印效果

#figure(image("img/2025-08-14-22-22-22.png"), caption: [打印效果])

= 提示

+ 命令 `edit example.txt` 可以创建或打开文件 `example.txt`，`CTRL-W`
  为关闭，`CTRL-S` 为保存，鼠标中键将系统剪贴板中的内容粘贴进去。
+ 如果转码后的图片过长，可能鼠标中键无法粘贴，可以考虑上传到网上然后在 OC
  中下载下来。
+ 在安装因特网卡的情况下，OC 中 `wget https://solitairemiya.cn/oc-pixelart/gtnh.txt` 即可下载网络上的文件。
+ 打印出的像素画需要自己按顺序手拼，如果像素画很大会比较牢。
+ 打印出的像素画要及时利用管道抽取，否则可能会漏打，少打。
+ 打印像素画命令中文件一定要用绝对路径，不支持相对路径。

= 现有资源

#figure(image("img/2025-08-14-20-36-00.png"), caption: [gtnh (64x64) #link("/oc-pixelart/gtnh.txt")[链接]])

#figure(image("img/2025-08-14-20-50-00.png"), caption: [miyabi (480x256) #link("/oc-pixelart/miyabi.txt")[链接]])

#figure(image("img/2025-08-15-15-44-00.png"), caption: [enigma (480x256) #link("/oc-pixelart/enigma.txt")[链接]])

#figure(image("img/2025-08-15-15-43-00.png"), caption: [touhu-project (480x256) #link("/oc-pixelart/touhu-project.txt")[链接]])

= OC 代码

和原版代码相比，添加了打印计数并输出的功能，同时在相邻两次打印之间加入 5
秒延迟，让管道能及时将打印出的图片抽走。在打开不存在的文件时，会报错并自动退出。

```lua
local component = require("component")
local shell = require("shell")
local fs = require("filesystem")

local printer = component.printer3d
local args = shell.parse(...)

-- we re intelligent -> make big images from one command possible
-- a + = new file

file = fs.open(args[1], "rb")
if not file then
  io.write("No file named " .. args[1])
  os.exit(1)
end

count = 1
n = file:read(1)
while n do
  printer.reset()
  printer.setLabel(args[2])
  printer.setTooltip(args[3])
  printer.setLightLevel(15)
  printer.setRedstoneEmitter(false)
  printer.setButtonMode(false)
  
  while n and n~='+' do
    -- n is the next char
    x = tonumber(n, 16)
    y = file:read(1)
    l = file:read(1)
    y = tonumber(y, 16)
    l = tonumber(l, 16) + 1
    printer.addShape(x, y, 15, x+1, y+l, 16, "opencomputers:White", false, tonumber(file:read(6), 16))
    n = file:read(1)
  end

  printer.commit(1)
  n = file:read(1)

  print("count: " .. count)
  count = count + 1

  os.sleep(5)
en
```

= 参考

- #link("https://www.bilibili.com/video/BV1wA4m1P7Xk/")[【GTNH/OC】如何在mc中用opencomputer mod打印图片\_我的世界]
- #link("https://www.youtube.com/watch?v=1AR8TVdyUWM")[原作者视频]
