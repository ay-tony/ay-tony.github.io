#import "../../templates/post.typ": *

#show: post.with(
  title: "概率论 4.4. Doob 不等式、p>1 时的 Lp 收敛",
  pub_date: (2025, 6, 26),
  upd_date: (2025, 6, 26),
  pub_time: (8, 45, 44),
  tags: ("概率论",),
  description: "",
)

#ex[
  Show that if $j lt.eq k$ then $uE (X_j ; N = j) lt.eq uE (X_k ; N = j)$
  and sum over $j$ to get a second proof of $uE X_N lt.eq uE X_k$.
]
#pf[
  $
    uE(X_k 1_{N=j}|sF_(k-1)) = 1_{N=j} uE(X_k|sF_(k-1))>=1_{N=j}X_(k-1),
  $ 两面取期望得到 $ uE(X_k\;N=j)>=uE(X_(k-1)\;N=j), $ 然后再归纳即可。
]

#ex[
  Generalize the proof of Theorem 4.4.1 to show that if $X_n$ is a
  submartingale and $M lt.eq N$ are stopping times with
  $P (N lt.eq k) = 1$ then $uE X_M lt.eq uE X_N$.
]
#pf[
  令 $H_n = 1_{M < n <= N}$ 为可预测策略，那么 $(H dot X)_n = X_(N and n) - X_(M and n)$ 是下鞅，从而 $ uE X_N - uE X_M = uE X_(N and k) - uE X_(M and k) = (H dot X)_k >= (H dot X)_0 = 0. $
]

#ex[
  Suppose $M lt.eq N$ are stopping times. If $A in sF_M$ then
  $ L = cases(delim: "{", M & upright("on ") A, N & upright("on ") A^c) $
  is a stopping time.
]
#pf[
  有 $ {L = n} = (A inter {M = n}) union (A^c inter {N=n}), $ 只要证明 $A inter {M=n}$ 和 $A^c inter {N=n}$ 都在 $sF_n$ 中。

  对于 $A inter {M=n}$，由于 $A in sF_M$ 故 $A inter {M=n} in sF_n$.

  对于 $A^c inter {N=n}$，在上面一定有 $M <= N = n$，故 $ A^c inter {N=n} = {N=n} inter union.big_(1 <= m <= n) A^c inter {M=m}, $ 其中 $A^c inter {M=m} in sF_m$，从而等号右侧 $in {sF_n}$.
]

#ex[
  Use the stopping times from the previous exercise to strengthen the
  conclusion of Exercise 4.4.2 to $X_M lt.eq uE (X_N|sF_M)$.
]
#pf[
  由 $L$ 是停时知道 $X_(L and n)$ 是下鞅。
]

#ex[
  Prove the following variant of the conditional variance formula. If
  $sF subset sG$ then
  $ uE (uE [Y|sG] - uE [Y|sF])^2 = uE (uE [Y|sG])^2 - uE (uE [Y|sF])^2 $
]

#ex[
  Suppose in addition to the conditions introduced above that
  $lr(|xi_m|) lt.eq K$ and let $s_n^2 = sum_(m lt.eq n) sigma_m^2$.
  Exercise 4.2.2 implies that $S_n^2 - s_n^2$ is a martingale. Use this
  and Theorem 4.4.1 to conclude
  $ P (max_(1 lt.eq m lt.eq n) lr(|S_m|) lt.eq x) lt.eq (x + K)^2 \/ upright("var") (S_n) $
]

#ex[
  The next result gives an extension of Theorem 4.4.2 to $p = 1$. Let
  $X_n$ be a martingale with $X_0 = 0$ and $uE X_n^2 < oo$. Show that
  $ P (max_(1 lt.eq m lt.eq n) X_m gt.eq lambda) lt.eq uE X_n^2 \/ (uE X_n^2 + lambda^2) $
  Hint: Use the fact that $(X_n + c)^2$ is a submartingale and optimize
  over $c$.
]

#ex[
  Let $X_n$ be a submartingale and $log^(+) x = max (log x , 0)$.
  $ uE X_n lt.eq (1 - e^(- 1))^(- 1) { 1 + uE (X_n^(+) log^(+) (X_n^(+))) } $
  Prove this by carrying out the following steps: \
  (i) Imitate the proof of 4.4.2 but use the trivial bound
  $P (A) lt.eq 1$ for $lambda lt.eq 1$ to show
  $ uE (X^(‾)_n and M) lt.eq 1 + integral X_n^(+) log (X^(‾)_n and M) d P $
  (ii) Use calculus to show
  $a log b lt.eq a log a + b \/ e lt.eq a log^(+) a + b \/ e$.
]

#ex[
  Let $X_n$ and $Y_n$ be martingales with $uE X_n^2 < oo$ and
  $uE Y_n^2 < oo$.
  $ uE X_n Y_n - uE X_0 Y_0 = sum_(m = 1)^n uE (X_m - X_(m - 1)) (Y_m - Y_(m - 1)) $
]

#ex[
  Let $X_n , n gt.eq 0$, be a martingale and let
  $xi_n = X_n - X_(n - 1)$ for $n gt.eq 1$. If
  $uE X_0^2 , sum_(m = 1)^oo E_(xi_m)^2 < oo$ then $X_n arrow.r X_oo$
  a.s. and in $L^2$.
]

#ex[
  Continuing with the notation from the previous problem. If
  $b_m arrow.t oo$ and $sum_(m = 1)^oo E_(xi_m)^2 \/ b_m^2 < oo$ then
  $X_n \/ b_n arrow.r 0$ a.s. In particular, if
  $E_(xi_m)^2 lt.eq K < oo$ and $sum_(m = 1)^oo b_m^(- 2) < oo$ then
  $X_n \/ b_n arrow.r 0$ a.s.
]
