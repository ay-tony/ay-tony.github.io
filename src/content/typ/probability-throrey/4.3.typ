#import "../../templates/post.typ": *

#show: post.with(
  title: "概率论 4.3. 例子",
  pub_date: (2025, 6, 24),
  upd_date: (2025, 6, 26),
  pub_time: (10, 2, 36),
  tags: ("概率论",),
  description: "",
)

#ex[
  Give an example of a martingale $X_n$ with $sup_n lr(|X_n|) < oo$
  and $P (X_n = a upright("i.o.")) = 1$ for $a = - 1 , 0 , 1$. This
  example shows that it is not enough to have
  $sup lr(|X_(n + 1) - X_n|) < oo$ in Theorem 4.3.1.
]
#pf[
  令 $X_0 = 0$。若 $X_(n-1) = 0$，则 $P(X_n = 1) = P(X_n = -1) = 1\/2$；若 $X_(n-1) != 0$，则 $P(X_n = 0) = 1-1\/n^2, P(X_n = n^2 X_(n-1)) = 1\/n^2$. $P(X_n = 0 "i.o.") = 1$ 可以由 Borel-Cantelli 引理得到，而 $P(X_n = 1 "i.o.") = P(X_n = -1 "i.o.")$ 是因为 $P(X_n = 1) = (1\/2) P(X_(n-1) = 0)$ 然后用 Borel-Cantelli 引理。$sup_n |X_n| < oo$ 是因为 $P(X_n = n^2 X_(n-1) "i.o.") = 0$ 用 Borel-Cantelli 引理，把这部分排除掉剩余部分满足 $sup_n |X_n| < oo$ a.s..
]

#ex[
  (Assumes familiarity with finite state Markov chains.) Fine tune
  the example for the previous problem so that
  $P (X_n = 0) arrow.r 1 - 2 p$ and
  $P (X_n = - 1) , P (X_n = 1) arrow.r p$, where $p$ is your favorite
  number in $(0 , 1 \/ 2)$, i.e., you are asked to do this for one value
  of $p$ that you may choose. This example shows that a martingale can
  converge in distribution without converging a.s. (or in probability).
]
#pf[
  *TODO*
]

#ex[
  Let $X_n$ and $Y_n$ be positive integrable and adapted to
  $sF_n$. Suppose $uE (X_(n + 1)|sF_n) lt.eq X_n + Y_n$, with
  $sum Y_n < oo$ a.s. . Prove that $X_n$ converges a.s. to a finite limit.
  Hint: Let $N = inf_k sum_(m = 1)^k Y_m > M$, and stop your
  supermartingale at time $N$.
]
#pf[
  首先构造上鞅 $Z_n = X_n - sum_(k=1)^(n-1) Y_n$. 由 $ uE(Z_(n+1)|sF_n) = uE(X_(n+1)|sF_n) - sum_(k=1)^n Y_k <= X_n - sum_(k=1)^(n-1) Y_k = Z_n $ 知道 $Z_n$ 是上鞅。对 $forall M > 0$，令停时 $ N = inf_k {sum_(m=1)^k Y_m > M}, $ 那么 $sum_(k=1)^((N and n) -1) Y_k <= M$，那么 $ Z_(N and n) = X_(N and n) - sum_(k=1)^((N and n) - 1) Y_k >= X_(N and n) - M $ 是上鞅，并且 a.s. 收敛，那么 $Z_n$ 在 ${N = oo} = {sum_(k=1)^oo Y_k <= M}$ 上 a.e. 收敛。令 $M -> oo$ 得到 $Z_n$ 在 $Omega$ 上 a.s. 收敛，那么 $X_n$ a.s. 收敛。
]

#ex[
  Let $p_m in [0 , 1]$. Use the Borel-Cantelli lemmas to show
  that
  $ product_(m = 1)^oo (1 - p_m) = 0 quad upright("if and only if") quad sum_(m = 1)^oo p_m = oo . $
]
#pf[
  令 $B_n$ 为互相独立的事件列，且 $P(B_n) = p_n$，那么由 Borel-Cantelli 引理知道 $ sum_(n=1)^oo P(B_n) = sum_(n=1)^oo p_n = oo <==> P(B_n "i.o.") = lim_(N -> oo) P(union.big_(n >= N) B_n) = 1, $ 这等价于 $ forall N > 0, P(union.big_(n >= N) B_n) = 1 - P(inter.big_(n >= N) B_n^c) = 1 - product_(n >= N) (1 - p_n) = 1 $ 即 $ product_(n = 1)^oo (1 - p_n) = 0. $
]

#ex[
  Show $ sum_(n = 2)^oo P (A_n | inter.big_(m = 1)^(n - 1) A_m^c) = oo $
  implies $ P (inter.big_(m = 1)^oo A_m^c) = 0. $
]
#pf[
  记 $X_n = sum_(k <= n) 1_A_k$，令 $ p_n = P(A_n | inter.big_(m=1)^(n-1) A_m^c) = P(X_n = 1 | X_(n-1) = 0), forall n >= 2. $ 那么由 $sum_(n=2)^oo p_n = oo$ 和上一题结论知道 $ product_(n=2)^oo (1-p_n) = 0. $ 从而 $ P(inter.big_(m=1)^oo A_m^c) &= lim_(n->oo)P(0 = X_1 = X_2 = ... = X_n)\
  &= lim_(n->oo) P(X_n = 0)\
  &= lim_(n->oo) P(X_n = 0|X_(n=1)=0) P(X_(n-1)=0|X_(n-2)=0) dots\
  &= product_(n=1)^oo (1-p_n) = 0. $
]

#ex[
  Check by direct computation that the $X_n$ in Example 4.3.7 is a
  martingale. Show that if we drop the condition $mu_n lt.double nu_n$ and
  set $X_n = 0$ when $nu(I_(k , n)) = 0$, then
  $uE (X_(n + 1)|sF_n) lt.eq X_n$.
]
#pf[
  对第一问，只要证明 $uE(X_(n+1)|sF_n) = X_n$，也即 $ integral_A X_n dd(nu) = integral_A uE(X_(n+1)|sF_n)dd(nu) = integral_A X_(n+1)dd(nu) quad forall A in sF_n. $ 由于 $sF_n$ 可以由有限个元素生成，无妨设 $A = I_(k_0, n) = I_(2k_0, n+1) union I_(2k_0+1, n+1)$. 那么 $ integral_I_(k_0, n) X_n dd(nu) = mu (I_(k_0,n)) =^* mu(I_(2k_0, n+1)) + mu(I_(2k_0 + 1, n + 1)) = integral_(I_(2k_0, n+1)union I_(2k_0+1, n+1)) X_(n+1) dd(nu) $ 从而得证。

  对第二问，仍然考虑上式。$*$ 处等号应改成 $>=$，因为等式右侧只包含所有 $nu > 0$ 的区间对应的项。
]

#ex[
  Apply Theorem 4.3.5 to Example 4.3.7 to get a "probabilistic"
  proof of the Radon-Nikodym theorem. To be precise, suppose $sF$ is
  countably generated (i.e., there is a sequence of sets $A_n$ so that
  $sF = sigma (A_n : n gt.eq 1)$) and show that if $mu$ and $nu$ are
  $sigma$-finite measures and $mu lt.double nu$, then there is a function
  $g$ so that $mu (A) = integral_A g d nu$. Before you object to this as
  circular reasoning (the Radon - Nikodym theorem was used to define
  conditional expectation!), observe that the conditional expectations
  that are needed for Example 4.3.7 have elementary definitions.
]
#pf[
  由 $sigma$-有限性，可以不妨设 $nu$ 是概率测度。令 $mu_n, nu_n$ 分别为 $mu, nu$ 在 $sF_n = sigma(A_1, A_2, ..., A_n)$ 上的限制。那么有 $mu_n << nu_n$ 成立，再令 $g_n = (dif mu_n)\/(dif nu_n), g = limsup g_n$，那么由定理 4.3.5 知道 $ mu(A) = integral_A g dd(nu) + mu(A inter {g = oo}). $ 由于 $mu << nu$ 知道 $mu$ 对 $nu$ 的 Lebesgue 分解存在且奇异部分为 $0$，从而 $ mu(A) = integral_A g dd(nu). $ 从例 4.3.7 也可以得出同样的结论。
]

For the next three exercises, suppose
$F_n , G_n$ are concentrated on ${ 0 , 1 }$ and have
$F_n (0) = 1 - alpha_n$, $G_n (0) = 1 - beta_n$.

#ex[
  + Use Theorem 4.3.8 to find a necessary and sufficient condition for $mu lt.double nu$.
  + Suppose that $0 < epsilon.alt lt.eq alpha_n , beta_n lt.eq 1 - epsilon.alt < 1$. Show that in this case the condition is simply $sum (alpha_n - beta_n)^2 < oo$.
]
#pf[
  对于第一问，首先有 $ q_n = dv(F_n, G_n) = cases(
    (1-alpha_n) / (1-beta_n)\, {0}\,,
    alpha_n beta_n\, {1}\,,
  ) $ 然后直接代入定理得到等价条件 $ product_(n=1)^oo integral sqrt(dv(F_n, G_n)) dd(G_n) =
  product_(n=1)^oo (sqrt(alpha_n beta_n) + sqrt((1-alpha_n)(1-beta_n))) > 0. $

  第二问 *TODO*。
]

#ex[
  Show that if $sum alpha_n < oo$ and $sum beta_n = oo$ in the
  previous exercise then $mu tack.t nu$. This shows that the condition
  $sum (alpha_n - beta_n)^2 < oo$ is not sufficient for $mu lt.double nu$
  in general.
]
#pf[
  直接由下一问可得。
]

#ex[
  Suppose $0 < alpha_n , beta_n < 1$. Show that
  $sum lr(|alpha_n - beta_n|) < oo$ is sufficient for $mu lt.double nu$ in
  general.
]
#pf[
  不妨设 $beta_n >= alpha_n$ 来去除绝对值。由 $sum (beta_n - alpha_n) < oo$ 知道 $ sum_(n=1)^oo (beta_n - sqrt(alpha_n beta_n))
  &= sum sqrt(beta_n) (sqrt(beta_n) - sqrt(alpha_n))\
  &= sum sqrt(beta_n) / (sqrt(alpha_n) + sqrt(beta_n)) (beta_n - alpha_n)\
  &>= sum 1 / 2 (beta_n - alpha_n)\
  &tilde sum (beta_n - alpha_n). $ 其中 $tilde$ 表示敛散性相同。同理可以得到 $ sum_(n=1)^oo (1-beta_n - sqrt((1-alpha_n)(1-beta_n))) < oo. $ 那么两式相加直接得到 $ sum_(n=1)^oo (1 - sqrt(alpha_n beta_n) - sqrt((1-alpha_n)(1-beta_n))) < oo. $
]

#ex[
  Show that if $P (lim Z_n \/ mu^n = 0) < 1$ then it is $= rho$
  and hence
  $ { lim Z_n / mu^n > 0 } = { Z_n > 0 upright("for all") n } quad upright("a.s.") $
]
#pf[
  令 $theta = P(lim Z_n\/mu^n = 0) < 1$，那么 $ theta = sum_(k >= 0) p_k theta^k = phi(theta), $ 那么 $theta = rho$. 之后是容易证明的。
]

#ex[
  Let $Z_n$ be a branching process with offspring distribution
  $p_k$, defined in part d of Section 4.3, and let
  $phi (theta) = sum p_k theta^k$. Suppose $rho < 1$ has
  $phi (rho) = rho$. Show that $rho^(Z_n)$ is a martingale and use this to
  conclude
  $P (Z_n = 0 upright("for some") n gt.eq 1 \| Z_0 = x) = rho^x$.
]
#pf[
  先证鞅性，有 $ uE(rho^(Z_(n+1))|sF_n)
  &= uE(product_(k=1)^(Z_n) rho^(xi_k^(n+1))|sF_n)\
  &= product_(k=1)^(Z_n) uE(rho^(xi_k^(n+1)))\
  &= uE(rho^(xi_k^(n+1)))^(Z_n)\
  &= (sum_(k>=0)p_k rho^k)^(Z_n)\
  &= phi^(Z_n)(rho)\
  &= rho^(Z_n). $

  对于第二问，由 $rho^(Z_n)$ 是非负鞅可以设 $rho^(Z_n) ->^"a.s." M$，下分析 $M$ 的分布。考虑集合 ${Z_n = 0 "ev."}$，此时 $rho^(Z_n) -> rho^0 = 1$，而在 ${Z_n != 0 forall n}$ 上，一定有 $mu > 1$ 从而 $rho < 1$，且 $Z_n -> oo$，从而 $rho^(Z_n) -> 0$. 那么只要证明 $rho^x=uE M$. 这是容易的，由控制收敛定理得到 $uE M = lim uE rho^(Z_n) = rho^x$.
]

#ex[
  Galton and Watson who invented the process that bears their
  names were interested in the survival of family names. Suppose each
  family has exactly 3 children but coin flips determine their sex. In the
  1800s, only male children kept the family name so following the male
  offspring leads to a branching process with $p_0 = 1 \/ 8$,
  $p_1 = 3 \/ 8$, $p_2 = 3 \/ 8$, $p_3 = 1 \/ 8$. Compute the probability
  $rho$ that the family name will die out when $Z_0 = 1$.
]
#pf[
  直接解方程 $ rho = 1 / 8 + 3 / 8 rho + 3 / 8 rho^2 + 1 / 8 rho^3, $ 解出 $rho = sqrt(5)-2$.
]
