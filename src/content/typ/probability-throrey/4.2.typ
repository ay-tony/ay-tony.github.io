#import "../../templates/post.typ": *

#show: post.with(
  title: "概率论 4.2. 鞅、几乎必然收敛",
  pub_date: (2025, 6, 22),
  upd_date: (2025, 6, 24),
  pub_time: (9, 21, 17),
  tags: ("概率论",),
  description: "",
)


#ex[
  Suppose $X_n$ is a martingale w.r.t. $sG_n$ and let
  $sF_n = sigma (X_1 , dots.h , X_n)$. Then
  $sG_n supset sF_n$, and $X_n$ is a martingale w.r.t. $sF_n$.
]
#pf[
  首先有 $X_n in sG_n$，又对 $forall m < n$ 有 $X_m in sG_m subset sG_(m+1) subset ... subset sG_n$，从而有 $X_m in sG_n forall m = 1, 2, ..., n$，那么 $sF_n = sigma(X_1, ..., X_n) subset sG_n$。
  $
    uE(X_(n+1)|sF_n) = uE(uE(X_(n+1)|sG_(n))|sF_n) = uE(X_n|sF_n)=X_n.
  $
]

#ex[
  Give an example of a submartingale $X_n$ such that $X_n^2$ is a
  supermartingale. #emph[Hint];: $X_n$ does not have to be random.
]
#pf[
  令 $P(X_n = 0) = 1$，那么 $X_n, X_n^2$ 在 $sF_n = sigma(X_1, ..., X_n)$ 上构成鞅。或者考虑 $X_n$ 不构成鞅的情况，令 $P(X_n) = -1\/n$ 即可。
]

#ex[
  Generalize part $1$ of Theorem 4.2.7 by showing that if $X_n$ and $Y_n$
  are submartingales w.r.t. $sF_n$, then $X_n or Y_n$ is also a
  submartingale.
]
#pf[
  $
    uE(X_(n+1)or Y_(n+1)|sF_n)
    >= uE(X_(n+1)|sF_n)
    >= X_n,\
    uE(X_(n+1)or Y_(n+1)|sF_n)
    >= uE(Y_(n+1)|sF_n)
    >= Y_n,\
  $ 那么 $uE(X_(n+1) or Y_(n+1)|sF_n) >= X_n or Y_n$。剩余的部分是显然的。
]

#ex[
  Let $X_n$, $n gt.eq 0$, be a submartingale with $sup_n X_n < oo$. Let
  $xi_n = X_n - X_(n - 1)$ and suppose $uE (sup_n xi_n^(+)) < oo$. Show that
  $X_n$ converges almost surely.
]
#pf[
  *TODO* 这道题不会。
]

#ex[
  Give an example of a martingale $X_n$ with $X_n arrow.r - oo$ a.s.
  #emph[Hint];: Let $X_n = xi_1 + dots.h.c + xi_n$, where $xi_i$ are
  independent (but not identiscrly distributed) with $uE xi_i = 0$.
]
#pf[
  令 $P(xi_n = -1) = n^2 \/ (n^2 + 1), P(xi_n = n^2) = 1 \/ (n^2 + 1)$，那么由 BC 引理知道 $P(xi_n = n^2 "i.o.") = 0$，那么 $X_n -> -oo$ a.s. .
]

#ex[
  Let $Y_1 , Y_2 , dots.h$ be nonnegative i.i.d. random variables with
  $uE Y_m = 1$ and $P (Y_m = 1) < 1$. By Example 4.2.3,
  $X_n = product_(m lt.eq n) Y_m$ defines a martingale.
  + Use Theorem 4.2.12 and an argument by contradiction to show $X_n arrow.r 0$ a.s.
  + Use the strong law of large numbers to conclude $(1 \/ n) log X_n arrow.r c < 0$.
]
#pf[
  + 首先存在 $X$ 使得 $X_n -->^"a.s." X$。由于 $P(Y_m = 1) < 1$，可以取 $epsilon > 0$ 使得 $P(|Y_m - 1| > epsilon) > 0$，这时有 $ P(X_n > epsilon) P(|Y_(n+1) - 1| > epsilon)
    &<= P(X_n |Y_(n+1)-1|>epsilon^2)\
    &= P(|X_(n+1)-X_n|>epsilon^2)\
    &->0 quad (n -> oo), $ 最后一行是因为 $X_n -->^"a.s." X$ 从而 $X_n$ 是基本列。那么一定有 $P(X_n > epsilon) -> 0$，那么 $X_n -->^P 0$，那么 $X =^"a.s." 0$。
  + 首先有 $ uE log Y_n < log uE Y_n = 0, $ 这里 Jensen 不等式不取等是因为 $P(Y_m = 1) < 1$ 从而达不到取等条件。那么 $uE log Y_n < oo$，可以应用广义强大数定律，有 $ (log X_n) / n
    &= (sum_(k=1)^n log Y_n) / n
    &-> uE log Y_n
    &= c < 0, $，其中 $c in [-oo, 0]$。
]

#ex[
  Suppose $y_n > - 1$ for all $n$ and $sum lr(|y_n|) < oo$. Show that
  $product_(m = 1)^oo (1 + y_m)$ converges to a finite limit.
]
#pf[
  参考陈纪修《数学分析》无穷乘积一节。
]

#ex[
  Let $X_n$ and $Y_n$ be positive integrable processes adapted to
  $sF_n$. Suppose
  $ uE (X_(n + 1)|sF_n) lt.eq (1 + Y_n) X_n $ with
  $sum Y_n < oo$ a.s. . Prove that $X_n$ converges a.s. to a finite limit by
  constructing a related supermartingale and applying Theorem 4.2.12.
]
#pf[
  由 $sum Y_n < oo$ a.s. 知道 $Y = product (1 + Y_n)$ a.s. 有定义。定义 $ Z_n = X_n / (product_(k=1)^(n-1) (1 + Y_k)), $ 那么 $ uE(Z_(n+1)|sF_n)
  &= uE(X_(n+1) / (product_(k=1)^(n) (1 + Y_k)) | sF_n)\
  &= 1 / (product_(k=1)^n (1 + Y_k)) uE(X_(n+1)|sF_n)\
  &<= 1 / (product_(k=1)^(n-1) (1 + Y_k)) X_n\
  &= Z_(n). $ 假设 $uE X_1 < oo$，那么 $uE(Z_n) <= uE(Z_(n-1)) <= ... <= uE(Z_1) = uE(X_1) < oo$，从而 $Z_n$ 构成一个上鞅，再应用不等式就知道 $X_n -->^"a.s." X$ 且 $uE X < oo$.
]

#ex[
  Suppose $X_n^1$ and $X_n^2$ are supermartingales w.r.t. $sF_n$, and
  $N$ is a stopping time such that $X_N^1 gt.eq X_N^2$. Define
  $ Y_n = X_n^1 bold(1)_({ N > n }) + X_n^2 bold(1)_({ N lt.eq n }) , $
  where $bold(1)$ is the indicator function. Show that $Y_n$ is a
  supermartingale.
]
#pf[
  $
    uE(Y_(n+1)|sF_n)
    &= uE(X_(n+1)^2 (1_{N <= n} + 1_{N=n+1}) + X_(n+1)^1(1_{N>n} - 1_{N=n+1})|sF_n)\
    &= uE(X_(n+1)^2 1_{N<=n}|sF_n) + uE(X_(n+1)^1 1_{N>n}|sF_n) +\
    &quad uE((X_(n+1)^2 - X_(n+1)^1) 1_{N=n+1}|sF_n)\
    &<= X_(n)^2 1_{N<=n} + X_(n)^1 1_{N>n} + uE((X_(n+1)^2 - X_(n+1)^1) 1_{N=n+1}|sF_n)\
    &<= Y_n + uE((X_(n+1)^2 - X_(n+1)^1) 1_{N=n+1}|sF_n),
  $ 那么只要证明后面一项非正，而由题目条件 $X_N^1>=X_N^2$ 这是显然的。
]

#ex[
  Dubins’ inequality. For every positive supermartingale $X_n$,
  $n gt.eq 0$, the number of upcrossings $U$ of $[a , b]$ satisfies
  $ P (U gt.eq k) lt.eq (a / b)^k uE min (X_0 / a , 1). $

  To prove this, we let $N_0 = - 1$ and for $j gt.eq 1$ let
  $
    N_(2 j - 1) & = inf { m > N_(2 j - 2) : X_m lt.eq a }\
    N_(2 j) & = inf { m > N_(2 j - 1) : X_m gt.eq b }.
  $

  Let $Y_n = 1$ for $0 lt.eq n < N_1$ and for $j gt.eq 1$

  $
    Y_n = cases(display((b / a)^(j - 1) (X_n / a) & upright("for ") N_(2 j - 1) lt.eq n < N_(2 j)), display((b / a)^j & upright("for ") N_(2 j) lt.eq n < N_(2 j + 1).))
  $

  + Use the switching principle in the previous exercise and induction to show that $Z_n^j = Y_(n and N_j)$ is a supermartingale.
  + Use $uE Y_(n and N_(2 k)) lt.eq uE Y_0$ and let $n arrow.r oo$ to get Dubins’ inequality.
]
#pf[
  对于第一问，用归纳法。首先 $Z_n^0 = 1$ 是上鞅。先假设 $Z_n^j = Z_n^(2k)$ 是上鞅，证明 $Z_n^(2k + 1)$ 是上鞅。$k=0$ 时，$ Z_n^1 = Y_(n and N_1) = cases(1\,n<N_1\,, X_N_1 / a\,n>=N_1.) $ 由 $X_N_1 <= a$ 知道 $Z_n^1$ 是上鞅。对于 $k >= 1$，有 $ Z_n^(2k+1) = cases(
    Z_n^(2k)\, n < N_(2k + 1)\,,
    (b / a)^k (X_(N_(2k + 1)) / a)\, n >= N_(2k + 1).
  ) $ 由于 $Z_n^2k, (b\/a)^k (X_(N_(2k+1))\/a)$ 都是上鞅，且上一题不等式成立，由上一题知道 $Z_n^(2k+1)$ 也是上鞅。

  再对于 $Z_n^j = Z_n^(2k-1)$ 为上鞅的情况证明 $Z_n^(2k)$ 是上鞅。有 $ Z_n^(2k) = cases(
    Z_n^(2k-1)\,n<N_(2k-1)\,,
    (b / a)^(k-1) (X_n / a)\,N_(2k-1) <= n < N_(2k)\,,
    (b / a)^k\,n>N_(2k).
  ) $ 再类似套用上一题不等式证明 $Z_n^(2k)$ 也是上鞅。

  然后用数学归纳法即可。

  对于第二问，有 $ uE min(X_0 / a, 1) = uE Y_0 >= lim_(n->oo) uE(Y_(n and 2k)) >= lim_(n->oo) uE(Y_(n and 2k)\; U>=k) = uE(lim_(n->oo)Y_(n and 2k)\; U >= k) = (a / b)^k $ 然后直接得到结果。
]
