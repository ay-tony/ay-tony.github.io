#import "../../templates/post.typ": *

#show: post.with(
  title: "操作系统实验 0. 概述和环境搭建",
  pub_date: (2025, 7, 2),
  upd_date: (2025, 7, 2),
  pub_time: (8, 19, 35),
  tags: ("操作系统", "uCore"),
  description: "",
)

= 课程

跟随的#link("https://learningos.cn/uCore-Tutorial-Guide-2022S/index.html")[清华大学 OS 课程实验 C 语言版指导书]，因为不熟悉 Rust 就没有选 Rust 的指导书。项目的 Github 仓库#link("https://github.com/LearningOS/uCore-Tutorial-Code-2022S")[见此]。

= 环境搭建

使用的 Arch Linux WSL 环境，参考指导书里的过程进行以下环境搭建操作。

+ `paru -S riscv64-elf-binutils riscv64-elf-gcc riscv64-elf-gdb` 安装交叉编译环境；
+ `paru -S qemu-emulators-full` 安装 qemu；
+ `git clone https://github.com/LearningOS/uCore-Tutorial-Code-2022S.git` 克隆仓库，并切到分支 `ch1` 进行测试；
+ 因为 Arch 包前缀和指导书里的不一样，按 `/Makefile:8:TOOLPREFIX = riscv64-elf-` 修改交叉编译器前缀；
+ 按 `/Makefile:2:all: build` 修改 `Makefile`，这样可以通过 `make` 达到和 `make build` 一样的效果。修改前 `make` 指令出错，疑似是原 `Makefile` 的疏漏；
+ 利用 Arch 中的 `bear` 包通过 `Makefile` 生成 `compile_commands.json` 供 `LSP` 读取，指令为 `bear -- make`；
+ 本地测试 `make run LOG=debug` 出现 `rustsbi panic`，替换了下 `/bootloader/rustsbi-qemu.bin` 就修好了。具体操作为从 #link("https://github.com/rustsbi/rustsbi-qemu")[`rustsbi-qemu`] 的仓库最新 Release 下载下来，然后将其中的 `rustsbi-qemu.bin` 替换掉项目中的文件即可。

这样，执行完 `make run LOG=debug` 后应当能出现正确的测试结果，如下。

```
~/p/ucore (ch1)> make run LOG=debug
qemu-system-riscv64 -nographic -machine virt -bios ./bootloader/rustsbi-qemu.bin -kernel build/kernel
[rustsbi] RustSBI version 0.2.2, adapting to RISC-V SBI v1.0.0
.______       __    __      _______.___________.  _______..______   __
|   _  \     |  |  |  |    /       |           | /       ||   _  \ |  |
|  |_)  |    |  |  |  |   |   (----`---|  |----`|   (----`|  |_)  ||  |
|      /     |  |  |  |    \   \       |  |      \   \    |   _  < |  |
|  |\  \----.|  `--'  |.----)   |      |  |  .----)   |   |  |_)  ||  |
| _| `._____| \______/ |_______/       |__|  |_______/    |______/ |__|

[rustsbi] Implementation: RustSBI-QEMU Version 0.1.1
[rustsbi-dtb] Hart count: cluster0 with 1 cores
[rustsbi] misa: RV64ACDFHIMSU
[rustsbi] mideleg: ssoft, stimer, sext (0x1666)
[rustsbi] medeleg: ima, ia, bkpt, la, sa, uecall, ipage, lpage, spage (0xb1ab)
[rustsbi] pmp0: 0x10000000 ..= 0x10001fff (rw-)
[rustsbi] pmp1: 0x2000000 ..= 0x200ffff (rw-)
[rustsbi] pmp2: 0xc000000 ..= 0xc3fffff (rw-)
[rustsbi] pmp3: 0x80000000 ..= 0x8fffffff (rwx)
[rustsbi] enter supervisor 0x80200000

hello wrold!
[ERROR 0]stext: 0x0000000080200000
[ERROR 0]ebss : 0x0000000080212000
[PANIC 0] os/main.c:39: ALL DONE
```
