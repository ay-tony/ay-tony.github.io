#import "../../templates/post.typ": *

#show: post.with(
  title: "概率论 1.1. 测度空间",
  pub_date: (2025, 6, 18),
  upd_date: (2025, 6, 18),
  tags: ("概率论",),
  description: "",
)

#ex[
  Let $Omega = bb(R)$, $scr(F) =$ all subsets so that $A$ or $A^c$ is countable, $P(A) = 0$ in the first case and $= 1$ in the second. show that $(Omega , scr(F) , P)$ is a probability space.
]
#pf[
  只要证明 $sF$ 是 $Omega$ 上的 $sigma$-域且 $P$ 是 $sF$ 上的测度。

  首先有 $diameter$ 可数，从而 $diameter, RR in sF$。考虑 $sF$ 中的集合列 ${A_i in sF}$。若存在 $k$ 使得 $A_k^c$ 可数，那么 $abs(union.big A_i) >= abs(A_k)$ 从而 $union.big A_i$ 的补集可数；若不存在上述 $A_k^c$，那么所有的 $A_i$ 均为可数集合，从而它们的可数并也可数。所以 $sF$ 是 $Omega$ 上的 $sigma$-域。

  设 ${A_i}$ 是 $sF$ 上的可数个不交集合列。容易看出 ${A_i}$ 中存在至多一个不可数集 $A_k$，那么若 $A_k$ 存在则 $P(union.big A_i) = sum P(A_i) = 1$；否则 $P(union.big A_i) = sum P(A_i) = 0$。
]

#ex[
  Rescrl the definition of $scr(S)_d$ from example 1.1.5. show that $sigma (scr(S)_d) = scr(R)^d$, the borel subsets of $bb(R)^d$.
]
#pf[
  对于 $sR^d$ 的一组拓扑基 $ {(x_1, y_1)times (x_2, y_2) ... times (x_d, y_d): x_i, y_i in RR} $ 中的一个开集 $ (x_1, y_2) times ... times (x_d, y_d), $ 有 $ (x_1, y_2) times ... times (x_d, y_d)
  &= union.big_j ((x_1, y_1 - 1 / j] times ... times (x_d, y_d - 1 / j]) in sS_d, $ 从而 $sigma(sS_d) subset sigma(sR^d)$。对 $sS_d$ 中的拓扑基 $ (x_1, y_2] times ... times (x_d, y_d], $ 有 $ (x_1, y_2] times ... times (x_d, y_d]
  &= inter.big_j ((x_1, y_1 + 1 / j) times ... times (x_d, y_d + 1 / j)) in sR_d, $ 从而 $sigma(sR^d) subset sigma(sS_d)$。
]

#ex[
  A $sigma$-field $scr(F)$ is said to be countably generated if there is a countable collection $scr(C) subset scr(F)$ so that $sigma (scr(C)) = scr(F)$. Show that $scr(R)^d$ is countably generated.
]
#pf[
  只要证明 $scr(R)^d$ 可以由 ${(a, b] : a, b in QQ}$ 生成，那么只要证明 ${(a, b]: a, b in RR}$ 可以被它生成，而对于 $forall (a, b]$ 为实数区间，一定存在单调下降的有理数列 $b_n arrow.b b$，从而 $ (a, b] = inter.big_n (a_n, b_n]. $ 那么 $(a, b]$ 可以被生成。
]

#ex[
  + Show that if $scr(F)_1 subset scr(F)_2 subset dots.h$ are $sigma$-algebras, then $inter.big_i scr(F)_i$ is an algebra.
  + Give an example to show that $union.big_i scr(F)_i$ need not be $sigma$-algebra.
]
#pf[
  + 设 $sF_i$ 是 $Omega$ 上的 $sigma$-代数，那么一定有 $diameter, Omega in sF_i$ 对每个 $i$ 成立。对 $forall A in inter.big_i sF_i$, 一定有 $A^c in inter.big_i sF_i$。对 $forall {A_n} in sF_i$，一定有 $union.big_n A_n in sF_i$。
  + 设 $Omega = NN^+, sF_i$ 为由 $2^{1, 2, ..., i}$ 生成的 $sigma$-代数。那么这时有 $union.big_i sF_i = 2^NN$。令 $A_i$ 为 $[1, i]$ 中所有偶数的集合，那么 $A_i in sF_i$ 对所有 $i in NN^+$ 成立，从而 $A_i in union.big_n sF_n$。这时 $union.big_i A_i$ 为 $NN*+$ 中所有偶数的集合，但是其并不包含于 $union.big_i sF_i$，因为它是无限集，而后者的所有元素都是有限集。
]

#ex[
  A set $A subset { 1 , 2 , dots.h }$ is said to have asymptotic density $theta$ if $ lim_(n arrow.r oo) lr(|A inter { 1 , 2 , dots.h , n }|) / n = theta. $ Let $scr(A)$ be the collection of sets for which the asymptotic density exists. Is $scr(A)$ a $sigma$-algebra? an algebra?
]
#pf[
  $sA$ 不是代数。令集合 $A$ 为 $N^+$ 中所有奇数的集合，那么显然有 $A$ 具有渐进密度 $1\/2$。再构造具有渐进密度为 $1\/2$ 的集合 $B$ 如下：$ B = {1, 4, 5, 7, 10, 12, 14, 16, 17, 19, 21, 23, ...}, $ $B$ 在所有形如 $(2^(2k-1), 2^(2k)]$ 的区间上取所有奇数，在所有形如 $(2^(2k), 2^(2k+1)]$ 的区间上取所有偶数。这时可以证明 $A union B$ 不具有渐进密度，因为在前 $2^(2k-1)$ 个数上的密度小于 $3\/4$，而在前 $2^(2k)$ 个数上的密度大于 $3\/4$。
]
