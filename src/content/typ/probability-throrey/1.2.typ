#import "../../templates/post.typ": *

#show: post.with(
  title: "概率论 1.2. 分布",
  pub_date: (2025, 6, 21),
  upd_date: (2025, 6, 21),
  pub_time: (9, 40, 0),
  tags: ("概率论",),
  description: "",
)

#ex()[
  Suppose $X$ and $Y$ are random variables on $(Omega , sF , P)$ and let $A in sF$. Show that if we let $Z (omega) = X (omega)$ for $omega in A$ and $Z (omega) = Y (omega)$ for $omega in A^c$, then $Z$ is a random variable.
]
#pf[
  对任意 Borel 集 $B in sR$，$ Z^(-1)(B)
  &= (Z^(-1)(B) inter A) union (Z^(-1)(B) inter A^c)\
  &= (X^(-1)(B) inter A) union (Y^(-1)(B) inter A^c)\
  &in sF. $ 从而 $Z$ 也是随机变量。
]

#ex()[
  Let $chi$ have the standard normal distribution. Use Theorem 1.2.6 to get upper and lower bounds on $P (chi gt.eq 4)$.
]
#pf[
  $
    P(chi >= 4)
    &= 1 / sqrt(2pi) integral_4^oo exp(x^2 / 2) dd(x)
    <= 1 / (4sqrt(2pi)) exp(8),\
    P(chi >= 4)
    &= 1 / sqrt(2pi) integral_4^oo exp(x^2 / 2) dd(x)
    >= (1 / 4 - 1 / 64) 1 / (sqrt(2pi)) exp(8).
  $
]

#ex()[
  Show that a distribution function has at most countably many discontinuities.
]
#pf[
  由于分布函数是单调有界函数，从数学分析相关知识知道其不连续点一定都是跳跃间断点，且不连续点至多可数。
]

#ex()[
  Show that if $F (x) = P (X lt.eq x)$ is continuous then $Y = F (X)$ has a uniform distribution on $(0 , 1)$, that is, if $y in [0 , 1] , P (Y lt.eq y) = y$.
]
#pf[
  对 $forall y in [0, 1]$，$ P(Y <= y)
  &= P(F(X) <= y)
  &= P(X <= F^(-1)(y))
  &= F(F^(-1)(y)) = y. $
]

#ex()[
  Suppose $X$ has continuous density $f$, $P (alpha lt.eq X lt.eq beta) = 1$ and $g$ is a function that is strictly increasing and differentiable on $(alpha , beta)$. Then $g (X)$ has density $ (f (g^(- 1) (y))) / (g prime (g^(- 1) (y))) $ for $y in (g (alpha) , g (beta))$ and $0$ otherwise. When $g (x) = a x + b$ with $a > 0$, $ g^(- 1) (y) = (y - b) / a $ so the answer is $ 1 / a f ((y - b) / a). $
]
#pf[
  对 $forall y in [alpha, beta]$，有 $ P(g(X) <= x) = P(X <= g^(-1)(x)) = integral_alpha^(g^(-1)(x)) f(t) dd(t). $ 令 $s = g^(-1)(t)$ 换元得到 $ P(g(X) <= x) = integral_alpha^(g^(-1)(x)) f(t) dd(t) = integral_g(alpha)^x f(g^(-1)(s)) / (g'(g^(-1)(s))) dd(s). $
]

#ex()[
  Suppose $X$ has a normal distribution. Use the previous exercise to compute the density of $exp (X)$. \(The answer is scrled the lognormal distribution.)
]
#pf[
  令 $g(X) = exp(X), g'(X) = exp(X), g^(-1)(y) = log(y)$ 得到 $exp(X)$ 的概率密度函数 $ f(g^(-1)(y)) / (g'(g^(-1)(y)))
  &= 1 / sqrt(2pi) (exp(-1 / 2 (log y)^2)) / (exp(log(y)))
  &= 1 / (sqrt(2pi)y) exp(-1 / 2 log^2 y). $
]

#ex()[
  + Suppose $X$ has density function $f$. Compute the distribution function of $X^2$ and then differentiate to find its density function.

  + Work out the answer when $X$ has a standard normal distribution to find the density of the chi-square distribution.
]
#pf[
  + 记 $X^2$ 的分布函数为 $G(x)$，那么 $ G(x) = P(X^2 <= x)
    &= P(- sqrt(x) <= X <= sqrt(x))
    &= integral_(-sqrt(x))^sqrt(x) f(t) dd(t). $ 即为其分布函数。记其概率密度函数为 $g$，则 $ g(x) = dv(G, x) = (f(sqrt(x)) + f(-sqrt(x))) / (2sqrt(x)). $
  + 代入正态分布概率密度函数得到 $ f_(chi^2)(x) = 1 / sqrt(2 pi x) exp(-x / 2). $
]

