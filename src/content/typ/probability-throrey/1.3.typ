#import "../../templates/post.typ": *

#show: post.with(
  title: "概率论 1.3. 随机变量",
  pub_date: (2025, 6, 21),
  upd_date: (2025, 6, 21),
  tags: ("概率论",),
  description: "",
)

#ex[
  Show that if $scr(A)$ generates $scr(S)$, then $X^(- 1) (scr(A)) equiv { { X in A } : A in scr(A) }$ generates $ sigma (X) = { { X in B } : B in scr(S) }. $
]
#pf[
  因为 $X^(-1)(sA) subset sigma(X)$，从而 $sigma(X^(-1)(sA)) subset sigma(X)$。对于任意包含 $X^(-1)(sA)$ 的 $sigma$-域 $sB$，$X(sB)$ 是包含 $sA$ 的 $sigma$-域，从而 $sA subset sS subset X(sB)$，那么 $X^(-1)(sA) subset sigma(X) subset sB$，那么 $sigma(X^(-1)(sA)) subset sigma(X) subset sB$，那么 $sigma(X)$ 是包含 $X^(-1)(sA)$ 的最小 $sigma$-域，从而 $sigma(X) = sigma(X^(-1)(sA))$.
]

#ex[
  Prove Theorem 1.3.6 when $n = 2$ by checking $ { X_1 + X_2 < x } in scr(F). $
]
#pf[
  因为 ${(-oo, x): x in RR}$ 可以生成 $sR$，所以只要证明 ${X_1 + X_2 < x} in sF$。容易看出 ${x' = (x_1, x_2) in RR^2: x_1 + x_2 < x} in sR^2$，从而 $f(x_1, x_2) = x_1 + x_2$ 是可测函数，那么 ${X_1 + X_2 < x} in sF$。
]

#ex[
  Show that if $f$ is continuous and $X_n arrow.r X$ almost surely then $f (X_n) arrow.r f (X)$ almost surely.
]
#pf[
  设 $X_n -> X$ 在 $Omega'$ 上满足，其中 $P(Omega') = 1$。那么对 $forall omega in Omega'$ 有 $X_n (omega) -> X(omega)$，又知道 $f$ 连续，从而 $f(X_n (omega)) -> f(x(omega))$。那么 $f(X_n) -> f(X)$ 在 $Omega'$ 上成立。
]

#ex[
  + Show that a continuous function from $bb(R)^d arrow.r bb(R)$ is a measurable map from $(bb(R)^d , scr(R)^d)$ to $(bb(R) , scr(R))$.
  + Show that $scr(R)^d$ is the smallest $sigma$-field that makes all the continuous functions measurable.
]
#pf[
  + 设 $f: RR^n -> RR$ 是连续函数，那么因为 ${(-oo, x)}$ 生成 $sR$，只要对 $forall x in RR$，证明 $f^(-1)((-oo, x)) in sR^d$ 即可。因为 $f$ 连续，那么 $f^(-1)((-oo, x))$ 为开集，从而是 Borel 集。
  + 只要证明 $ sR^d = sigma({f^(-1)((-oo, x)) : x in RR, f in C^(oo)(RR^d)}). $ 由上一问已经知道 $ sigma({f^(-1)((-oo, x)) : x in RR, f in C^(oo)(RR^d)}) subset sR^d. $ 考虑任意包含 ${f^(-1)((-oo, x)) : x in RR, f in C^(oo)(RR^d)}$ 的 $sigma$-域 $sA$。取定 $sR^d$ 的一组生成元 ${(-oo, x_1) times ... times (-oo, x_d) : x_1, ..., x_d in RR}$，取其中的一个元素为 $(-oo, x_1) times ... times (-oo, x_d)$。那么可以构造连续函数 $ f(vx) = "dis"(vx, (-oo, x_1) times ... times (-oo, x_d)), $ 其中 $"dis"$ 表示距离函数。那么有 $f^(-1)((-oo, 0)) = (-oo, x_1) times ... times (-oo, x_d)$，从而 $sR^d subset sA$。那么命题得证。
]

#ex[
  A function $f$ is said to be lower semicontinuous or l.s.c. if $ liminf_(y arrow.r x) f (y) gt.eq f (x) $ and upper semicontinuous (u.s.c.) if $- f$ is l.s.c. Show that $f$ is l.s.c. if and only if ${ x : f (x) lt.eq a }$ is closed for each $a in bb(R)$ and conclude that semicontinuous functions are measurable.
]
#pf[
  先证必要性，假设 $f$ 是下半连续的，只要对 $forall a in RR$，证 ${x: f(x) > a}$ 是开集。从中任取 $x$，那么有 $ liminf_(y -> x)f(y) >= f(x) > a， $ 从而存在 $x$ 的邻域 $U(x, delta(x))$ 使得对 $forall y in (x, delta(x))$ 有 $ f(y) >= (f(x) + a) / 2 > a, $ 从而 $x$ 是 ${x: f(x) > a}$ 的内点，那么 ${x: f(x) > a}$ 是开集。

  再证充分性。假设对 $forall a in RR$，${x: f(x) <= a}$ 是闭集，从而 ${x: f(x) > a}$ 是开集。$forall x_0 in RR$，考虑令 $y -> x_0$。对 $forall a < f(x_0)$，知道 $f(x_0)$ 附近存在邻域 $U$ 使得 $forall y in U$ 有 $f(y) > a$。令 $a arrow.t f(x_0)$ 即得到 $liminf f(y) >= f(x_0)$。

  从而上半连续函数都是可测函数，类似可以证明下半连续函数都是可测函数。
]

#ex[
  Let $f : bb(R)^d arrow.r bb(R)$ be an arbitrary function and let $ f^delta (vx) = sup { f (vy) : lr(|vy - vx|) < delta } $ and $ f_delta (vx) = inf { f (vy) : lr(|vy - vx|) < delta } $ where $ lr(|vz|) = sqrt(vz_1^2 + dots.h + vz_d^2). $

  Show that $f^delta$ is l.s.c. and $f_delta$ is u.s.c. Let $f^0 = lim_(delta arrow.b 0) f^delta$, $f_0 = lim_(delta arrow.b 0) f_delta$, and conclude that the set of points at which $f$ is discontinuous $= { f^0 eq.not f_0 }$ is measurable.

  follows from the fact that $f^0 − f_0$ is.
]
#pf[
  直接按定义验证得到 $f^delta$ 是上半连续函数而 $f_delta$ 是下半连续函数。接下来只要证明 $f$ 的不连续点集就是 ${f^0 != f_0}$。

  假设 $vx in RR^d$ 是 $f$ 的不连续点，那么存在 $epsilon_0 > 0$，存在收敛到 $vx$ 的点列 ${vx'_n}$ 和 ${vx''_n}$ 使得 $|lim f(vx'_n) - lim f(vx''_n)| < epsilon_0$。不妨设 $ lim f(vx'_n) > lim f(vx''_n) + epsilon_0. $ 对 $forall delta > 0$，总能找到 $vx'_n_0, vx''_n_0$ 使得 $ |vx'_n_0 - vx|, |vx''_n_0 - vx| < delta $ 且 $ f(vx'_n_0) >= f(vx''_n_0) + epsilon_0 / 2, $ 从而一定有 $ f^delta (vx) >= f(vx'_n_0) >= f(vx''_n_0) + epsilon_0 / 2 >= f_delta (vx). $ 令 $delta arrow.b 0$ 得到 $f^0 (vx) >= f_0 (vx) + epsilon_0 \/ 2$。

  再假设 $vx_0$ 是 $f$ 的连续点，那么对 $forall epsilon > 0$，存在 $delta > 0$ 使得 $forall vx in U(vx_0, delta)$ 有 $abs(f(vx) - f(vx_0)) < epsilon$，从而 $ abs(f^(delta) - f_delta) <= abs(f^delta - f(vx_0)) + abs(f_delta - f(vx_0)) < 2 epsilon. $ 令 $epsilon -> 0$ 即可知道 $f^0 = f_0$。
]

#ex[
  A function $phi : Omega arrow.r bb(R)$ is said to be simple if $ phi (omega) = sum_(m = 1)^n c_m 1_(A_m) (omega) $ where the $c_m$ are real numbers and $A_m in scr(F)$. Show that the class of $scr(F)$ measurable functions is the smallest class containing the simple functions and closed under pointwise limits.
]
#pf[
  设 $P$ 是由从 $Omega$ 到 $RR$ 上的部分函数构成的集合，满足所有的简单函数都属于 $P$ 且对点态极限运算封闭。那么只要证明所有的 $sF$ 可测函数都在 $P$ 中。对 $forall f: Omega -> RR$ 为 $sF$ 可测函数，由 $f = f^+ - f^-$ 可以不妨设 $f>=0$。那么直接构造简单函数列 $ quad phi_n (omega) = cases(
    n\, quad thin &f(omega) >= n,
    , display(k / 2^n\, &k / 2^n <= f(omega) < (k+1) / 2^n\, k = 0\, 1\, ...\, n 2^n-1)
  ). $ 容易看出 $phi_n$ 点态收敛于 $f$，从而 $f in P$。
]

#ex[
  Use the previous exercise to conclude that $Y$ is measurable with respect to $sigma (X)$ if and only if $Y = f (X)$ where $f : bb(R) arrow.r bb(R)$ is measurable.
]
#pf[
  充分性是显然的，下证明必要性。设 $Y$ 在 $sigma(X)$ 上可测。那么由上一问题知道 $Y$ 可以写成 $sigma(X)$ 上的简单函数的点态极限，记为 $Y = lim phi_n$。同样可以将 $X$ 写为 $X = lim psi_n$。记 $ phi_n = sum_(m=1)^(a_n) c_(n, m) 1_(A_(n, m)), \
  psi_n = sum_(m=1)^(a_n) d_(n, m) 1_(A_(n, m)), \ $ 可以不妨设 ${d_(n, m)}_m$ 两两不同。那么令 $ f_n: RR -> RR, f(d_(n, m)) = c_(n, m), "否则" f = 0. $ 那么就有 $f_n (psi_n) = phi_n$。令 $n -> oo$，则有 $f(X) = Y$，且 $f$ 为可测函数。
]

#ex[
  To get a constructive proof of the last result, note that $ { omega : m 2^(- n) lt.eq Y < (m + 1) 2^(- n) } = { X in B_(m , n) } $ for some $B_(m , n) in scr(R)$ and set $f_n (x) = m 2^(- n)$ for $x in B_(m , n)$ and show that as $n arrow.r oo$ $f_n (x) arrow.r f (x)$ and $Y = f (X)$.
]
#pf[
  同上题。
]

