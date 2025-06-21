#import "../../templates/post.typ": *

#show: post.with(
  title: "概率论 1.4. 积分",
  pub_date: (2025, 6, 21),
  upd_date: (2025, 6, 21),
  pub_time: (9, 45, 52),
  tags: ("概率论",),
  description: "",
)

#ex()[
  Show that if $f gt.eq 0$ and $integral f thin d mu = 0$ then $f = 0$ a.e..
]
#pf[
  设 $A = {f > 0} = union.big_n {f > 1 \/ n}$。若 $mu(A) > 0$，那么由测度的连续性知道，存在足够大的 $n_0 in NN^*$ 使得 $mu({f > 1\/n}) > 0$。那么 $ integral f dd(mu)
  &= integral_A f dd(mu) + integral_(A^c) f dd(mu)\
  &= integral_A f dd(mu) \
  &= integral_{f > 1 / n} f dd(mu) \
  &>= integral_{f > 1 / n} 1 / n dd(mu) \
  &= 1 / n mu({f > 1 / n}) \
  &> 0, $ 从而矛盾。
]

#ex()[
  Let $f gt.eq 0$ and
  $
    E_(n , m) = { x : m / 2^n lt.eq f (x) < (m + 1) / 2^n }.
  $ As
  $n arrow.t oo$, $ sum_(m = 1)^oo m / 2^n mu (E_(n , m)) arrow.t integral f thin d mu. $
]
#pf[
  不妨设 $lambda = sum_m mu(E_(n, m))$ 有限，否则命题化为 $oo arrow.t oo$ 显然成立。那么有 $ & quad integral f dd(mu) - sum_(m=1)^oo m / 2^n mu(E_(n, m))\
  &= sum_(m=1)^oo integral_(E_(n, m)) (f - m / 2^n) dd(mu)\
  &<= sum_(m=1)^oo integral_(E_(n, m)) 1 / 2^n dd(mu)\
  &<= sum_(m=1)^oo mu(E_(n, m)) / 2^n \
  &= lambda / 2^n arrow.b 0 quad (n -> oo). $ 从而命题得证。
]

#ex()[
  Let $g$ be an integrable function on $bb(R)$ and $epsilon > 0$.
  + Use the definition of the integral to conclude there is a simple
    function $phi = sum_k b_k 1_(A_k)$ with $ integral lr(|g - phi|) thin d mu < epsilon. $
  + Use Exercise A.2.1 to approximate the $A_k$ by finite unions of
    intervals to get a step function
    $ q = sum_(j = 1)^k c_j 1_((a_(j - 1) , a_j)) $ with
    $a_0 < a_1 < dots.h < a_k$, so that $ integral lr(|phi - q|) < epsilon. $
  + Round the corners of $q$ to get a continuous function $r$ so that $ integral lr(|q - r|) thin d mu < epsilon. $

  To make a continuous function replace each $c_j 1_((a_(j - 1) , a_j))$
  by a function that is $0$ on $(a_(j - 1) , a_j)^c$, $c_j$ on
  $[a_(j - 1) + delta_j , a_j - delta_j]$, and linear otherwise. If the
  $delta_j$ are small enough and we let $ r (x) = sum_(j = 1)^k r_j (x) $ then
  $ integral lr(|q (x) - r (x)|) thin d mu = sum_(j = 1)^k delta_j c_j < epsilon. $
]
#pf[
  + 由于 $g = g^+ - g^-$ 不妨先证明 $g^+$，然后类似证明 $g^-$。由积分的定义知道存在可测函数 $h^+$，使得 $0 <= h^+ <= g$，$h^+$ 有界，且支集测度有限，且 $ integral abs(g - h^+) dd(mu) < epsilon / 4. $ 对 $h^+$，再由积分定义知道存在非负简单函数 $phi^+ <= h^+$，使得 $ integral abs(h^+ - phi^+) dd(mu) < epsilon / 4. $ 那么 $ integral abs(g^+ - phi^+) dd(mu) < integral abs(g^+ - h^+) dd(mu) + integral abs(h^+ - phi^+) dd(mu) < epsilon / 2. $ 类似得到 $phi^-$ 满足 $ integral abs(g^- - phi^-) dd(mu) < integral abs(g^- - h^-) dd(mu) - integral abs(h^- - phi^-) dd(mu) < epsilon / 2. $ 令 $phi = phi^+ - phi^-$ 直接得到结果。

  + 记 $ phi = sum_(i=1)^n b_i 1_A_i. $ 对每个 $A_i$，由测度近似定理知道存在有限个开区间 $B_(i, 1), ..., B_(i, b_i)$ 使得对 $B_i = union.big_j B_(i, j)$ 有 $A_i subset B_i$ 且 $ mu(B_i \\ A_i) < epsilon / (b_i n). $ 那么就有 $ phi = sum_(i=1)^n sum_(j=1)^b_i b_i 1_B_(i, j), $ 重新排列就能够得到欲证命题。
]

#ex()[
  Prove the Riemann-Lebesgue lemma. If $g$ is integrable then $ lim_(n arrow.r oo) integral g (x) cos n x thin dd(x) = 0. $

  Hint: If $g$ is a step function, this is easy. Now use the previous exercise.
]
#pf[
  先证明对于任意开区间 $(l, r)$ 成立 $ lim_(n arrow.r oo) integral_((l, r)) cos n x thin dd(x) = 0. $ 考虑到 $cos n x$ 是以 $2\/n$ 为周期的周期函数，且在一个周期内的积分是 $0$，从而知道 $ abs(integral_((l, r)) cos n x thin dd(x)) = abs(integral_((l, l + delta)) cos n x dd(x)) <= integral_((l, l+delta)) abs(cos n x) dd(x) <= delta, $ 其中 $delta < 2 \/ n$. 令 $n -> oo$ 就得到积分趋近于 $0$. 那么对任意的 step function $g$，记 $ g = sum_(i=1)^k c_i 1_((a_i, b_i)), $ 那么就有 $ lim_(n arrow.r oo) integral g (x) cos n x thin dd(x)
  &= sum_(i=1)^k c_i lim_(n -> oo) integral_((a_i, b_i)) cos n x dd(x)
  &= 0. $ 从而原命题在 $g$ 为 step function 时成立。对于 $g$ 为任意可积函数，$n in NN^*$ 的情况，存在 step function 构成的函数列 ${h_k}$ 使得 $ &quad integral abs(g(x)cos n x - h_k (x) cos n x) dd(x)\
  &<= integral abs(g(x) - h_k (x)) dd(x)\
  &-> 0 quad (k -> oo). $ 从而有 $ &quad abs(lim_(n arrow.r oo) integral g(x) cos n x thin dd(x))\
  &<= lim_(n arrow.r oo) integral abs(g(x) cos n x) thin dd(x)\
  &<= lim_(n arrow.r oo) lim_(k -> oo) integral abs(g(x) cos n x - h_k (x) cos n x) + lim_(n arrow.r oo) lim_(k -> oo) integral abs(h_k (x) cos n x) thin dd(x)\
  &<= 0 + 0\
  &= 0. $
]
