#import "../templates/post.typ": *

#show: post.with(
  title: "The Modern Mathematics of Deep Learning",
  pub_date: (2025, 10, 9),
  upd_date: (2025, 10, 9),
  pub_time: (2, 54, 36),
  tags: ("机器学习", "论文阅读"),
  description: "",
)

= 机器学习理论基础

== 机器学习模型

#de(title: "非正式的机器学习理论")[
  令 $sX, sY$ 和 $sZ$ 为可测空间. 在机器学习过程中，给定数据集合 $sZ$
  的一个子集和损失函数 $sL: sM(sX, sY) times sZ -> RR$.
  我们希望能够选出一个假设集（hypothesis set）$sF subset sM(sX, sY)$
  并设定一个学习算法，也就是一个映射 $ sA : union.big_(m in NN) sZ^m -> sF, $ 它接受一组数据 $s =
  {z^((i))}_(i=1)^m in sZ^m$ 并找到一个模型 $f_s = sA(s) in
  sF$，使得它在训练数据 $s$ 上“表现良好”，且能够“泛化”到所有数据 $z in sZ$ 上.
  这里的“表现良好”通过损失函数 $sL$ 和对应的取值 $sL(f_s, z)$
  来刻画，而“泛化”，不严谨地讲就是 $f_s$ 对所有 $s$ 内数据和 $s$
  外数据的“表现”是相近的.
]

在这个定义中，$sX$
表示模型的输入空间，每个可能的输入 $x in sX$ 构成其中的一个点；$sY$
代表模型的输出空间，每个可能的输出 $y in sY$ 构成其中的一个点. $sM(sX, sY)$ 表示所有从 $sX$
到 $sY$
的可测映射，但是由于模型的结构限制，模型无法将所有的可测映射表示出来，所有模型能够表示的映射构成
$sM(sX, sY)$ 的子集 $sF$. 这个集合 $sF$ 中的每一个点 $f in sM(sX, sY)$
都表示一个特定的模型，或者说模型的一种参数取法.

在学习过程中，我们还需要一些数据，这些数据会通过一些方式转化为多组输入和输出，用以对模型进行训练.
比如对于预测任务来说，每个数据就是一对输入和输出的二元组 $(x, y) in sX times
sY$.
假设所有可能的数据构成的数据空间为 $sZ$，每个可能的数据 $z in sZ$
构成其中的一个点. 那么一个包含 $m$ 个数据的数据集可以表示为 $s =
{z^((i))}_(i = 1)^m in sZ^m$.

模型学习就是依据给定的数据集 $s in sZ^m$ 去挑选合适的模型 $f in sF$ 的过程.
在挑选的过程中，我们需要损失函数 $ sL: quad sM(sX, sY) times sZ -> RR, quad (f, z) |->
sL(f, z) $ 来表示一个模型 $f$ 在给定数据 $z$ 下的“表现”. 依据损失函数
$sL$，就可以设定学习算法了. 学习算法就是一个映射 $ sA : union.big_(m in NN) sZ^m
-> sF, $ 其接受一个任意大小的数据集 $s in sZ^m$ 并得到一个选定的模型 $f_s =
sA(s) in sF$，也就是一般意义下训练好的模型.

#de(title: "预测任务")[
  在预测任务中，我们有 $sZ = sX times sY$，也就是说每组数据具有 $s = {(x^((i)),
      y^((i)))}_(i=1)^m in (sX times sY)^m$ 的形式. 每组数据包含模型的输入
  $x^((i)) in sX$ 和对应的标签 $y^((i)) in sY$.

  特别地，对于 $sY subset RR$ 的一维回归任务，可以设定方差损失函数 $sL(
    f, (x,
      y)
  ) = (f(x) - y)^2$. 对于 $sY = {-1, 1}$ 的二元分类任务，可以设定 0-1 损失函数
  $sL(x, y) = bb(1)_((-oo, 0))(y f(x))$.
  同时假设模型的输入空间是欧氏空间，也就是说 $sX subset RR^d$，其中 $d in NN^+$.
]

在预测任务中，对于每组数据 $(x, y) in sX times sY$，我们希望得到的模型 $f_s$
能够对 $x$ 做出预测，且做出的预测 $f_s (x)$ 与 $y$ 相近.

人们经常将很多半监督或者无监督学习任务转化为预测任务.
确切地说，我们会设计转化映射 $T_1, T_2$，将训练数据 $z^((i)) in sZ$ 转化为 $x^((i)) = T_1
(z^((i))) in sX$ 和 $y^((i)) = T_2 (z^((i))) in sY$.
这样，我们的训练过程就是寻找一个模型 $f_s$ 逼近变换 $T_2 circ T_1^(-1): sX ->
sY$.

另外，我们也有密度估计任务，也就是让 $sX = sZ, sY = [0, oo]$，且 $sF$ 由
$sZ$ 上的所有可能的 $sigma$-有限测度 $mu$ 诱导的概率密度函数构成.
这时学习的目标是找到一个概率密度函数 $f_s$ 使得其尽量逼近一个特定的
$sigma$-有限测度 $mu_0$
所诱导的概率密度函数. 如果想要 $L^2 (mu)$-逼近，可以选取损失函数为
$sL(f, z)=-2f(z)+||f||_(L^2 (mu))^2$；如果想要最大似然估计，可以选取 $sL(f, z)
= -log(f(z))$.

== 神经网络

在实践中假设集 $sF$ 主要包括神经网络结构的实现 $Phi_a (dot, theta), theta in
sP$. 其中的 $Phi$ 代表神经网络，$a$ 为神经网络的结构，$sP$ 为神经网络在结构 $a$
下的参数空间，也即所有可能的参数构成的集合，而其中的一个元素 $theta in sP$
代表一组可能取到的参数.

下文主要研究的是全连接前向（Fully Connected Feedforward, FC）神经网络结构.

#de(title: "全连接前向神经网络")[
  一个全连接神经网络结构可以描述为 $a = (N, rho.alt)$，其中 $L in NN$ 为层数，$N
  in NN^(L+1)$ 为每层的神经元数量，$rho.alt: RR -> RR$ 为激活函数. 这样，$N_0$
  就表示输入层，$N_L$ 表示输出层，而 $N_1, N_2, ..., N_(L-1)$ 表示隐藏层.
  所有参数的数量可以表示为 $ P(N) := sum_(l=1)^L (N_l N_(l-1) + N_l), $
  从而定义神经网络的实现为 $ Phi_a: RR^(N_0) times RR^(P(N)) -> RR^(N_L), $
  对每个输入 $x in RR^(N_0)$ 和参数 $ theta = {theta^((l))}_(l=1)^L =
  {(W^((l)),b^((l)))}_(l=1)^L in product_(l=1)^L (RR^(N_l times N_(l-1)) times
    RR^(N_l)) tilde.equiv RR^(P(N)) $ 有 $Phi_a (x, theta) = Phi^((L)) (x,
    theta)$，其中 $           Phi^((1))(x, theta) & = W^((1))x + b^((1)), \
  overline(Phi)^((l))(x, theta) & = rho.alt(Phi^((l))(x, theta)), quad l = 1,
                                  2, ..., L-1, \
          Phi^((l+1))(x, theta) & = W^((l+1))overline(Phi)^((l))(x, theta) +
                                  b^((l+1)), l = 1, 2, ..., L-1. $ 这里
  $rho.alt$ 是逐项施加的. 称 $W^((l)) in RR^(N_l times N_(l-1))$ 和 $b^((l)) in
  RR^(N_l))$ 是第 $l$ 层的权重矩阵和偏置向量，$overline(Phi)^((l))$ 和
  $Phi^((l))$ 为第 $l$ 层的激活值和未激活值. 称 $||N||_oo$ 为网络的宽度，$L$
  为网络的深度. 如果 $L > 2$，称网络结构是深的；如果 $L = 2$，称网络结构是浅的.
]

以下如无特殊说明，所有神经网络（Neural Network, NN）均指全连接前向神经网络.

需要说明的是，自然映射 $(a, theta) |-> Phi_a (dot, theta)$
不是单射，也就是说，可能会有参数不同的神经网络，它们代表着同一个模型.
比如说令最后一层的 $W^((L)) = 0$，那么 $Phi_a (dot, theta) =
b^((L))$，此时前面层数的参数取值变得无关紧要.

#de(title: "神经网络的假设集")[
  给定神经网络结构 $a = (N, rho.alt)$，且 $N_0 = d, N_L = 1$.
  对于回归任务，假设集就是 $ sF_a = {Phi_a (dot, theta) : theta in RR^(P(N))}. $对于分类任务，假设集就是 $ sF_(a,sgn) = {sgn(Phi_a (dot, theta)): theta in RR^(P(N))}. $
]

== 机器学习策略

在给定神经网络下我们能够表示出其假设集，接下来就可以设计学习策略，选取假设集中的一个特定映射.
以下介绍的经验风险最小化（Empirical Risk Minimization,
ERM）算法就是这样一个例子.

#de(title: "经验风险")[
  取定训练数据 $s = {z^((i))}_(i=1)^m in sZ^m$ 和映射 $f in sM(
    sX,
    sY
  )$，定义经验风险为 $ hat(sR_s)(f) := 1/m sum_(i=1)^m sL(f, z^((i))). $
]

所谓经验风险，通俗地讲就是对已知数据的所有误差作平均.

#de(title: "ERM 学习算法")[
  对于假设集 $sF$ 和训练数据 $s in sZ^m$，ERM 算法 $sA^"ERM"$ 选取 $sF$
  中使经验风险 $hat(sR_s)$ 最小的一项 $hat(f)_s in sF$. 也就是 $ sA^"ERM"(s) in argmin_(f in sF)hat(R)_s (f). $
]

在以上定义中，我们武断地认为 $hat(f)_s$ 是可以取到的，这是为了简便起见.
我们可以假设 $sF$ 是一个紧的拓扑空间，而 $hat(sR)_s$
是连续的，这样就一定可以取到最小值了.
要达到这样的条件，将参数空间设定为一个紧集 $sP subset
RR^(P(N))$，并设激活函数 $rho.alt$ 连续即可.

在分类任务中，我们需要对不可导函数 $sgn Phi_a (dot, theta)$ 做最优化.
这时实际的假设集为 $sF_(a, sgn)$，但是一般使用对应回归任务的假设集 $sF_a$
进行学习，并找到一个解 $hat(f)^"surr"_s in sF_a$ 来最小化 $ 1 / m sum_(i=1)^m sL^"surr" (f, z^((i))), $ 其中 $sL^"surr": sM(sX, RR) times sZ -> RR$ 是替代损失函数（Surrogate
Loss），这个函数的选取要保证 $hat(f)^"surr"_s$ 满足 $ sgn(hat(f)^"surr"_s) in
argmin_(f in sF_(a,sgn))hat(sR)_s (f). $ 一个常见的选取方法是 Logistic 损失 $ sL^"surr" (f,z) = log(1 + ue^(-y f(x))). $ 这个损失函数也可以看作标签 $y$
和模型输出 $f(x)$ 的交叉熵.

在很多学习任务中通常还会在最终的损失中加入正则项，比如加入参数范数带来的惩罚，如
$ sA(s) in argmin_(theta in RR^(P(N))) hat(sR)_s (Phi_a (dot, theta)) + alpha
||theta||_2^2. $ 其中 $alpha in (0, oo)$ 是正则化参数.
在这种情况下，最终选取的模型还和具体参数有关系，而不仅由实现函数 $Phi_a (dot,
  theta)$ 决定.

== 样本

在样本的选取上，我们假设 $z^((1)), z^((2)), ..., z^((m))$ 和隐藏数据（unseen
data） $z$ 都取样于独立同分布的随机变量 $Z^((1)), Z^((2)), ..., Z^((m)), Z$. 记 $PP_Z$ 是随机变量 $Z$ 在 $sZ$ 上的像测度.

#de(title: "风险（Risk）")[
  对于映射 $f in sM(sX, sY)$，定义其风险为 $ sR(f) := EE[sL(f, Z)] = integral_sZ
  sL(f, z) dd(PP_Z (z)). $ 定义 $S := {Z^((i))}_(i=1)^m$，那么模型 $f_S = sA(S)$
  的风险就是 $ sR(f_S) = EE[sL(f_S, Z)|S]. $
]

那么，对于二分类问题而言，我们就得到 $ sR(f) = EE[bb(1)_((-oo, 0))(Y f(X))] = PP[f(X) != Y]. $

#de(title: "贝叶斯最优函数")[
  映射 $f^* in sM(sX, sY)$ 能达到的最小风险称为贝叶斯风险，也即 $ sR^* := inf_(f
  in sM(sX, sY)) sR(f). $ 此时取到的映射 $f^*$ 称为贝叶斯最优函数.
]

#tho(title: "回归和分类任务的风险分解")[
  对于 $VV[Y]<oo$ 的回归任务，风险可以分解为 $ sR(f) = EE[(f(X) - EE[Y|X]^2)] +
  sR^*, quad f in sM(sX, sY). $ 此时贝叶斯最优函数为 $f^* (x) = EE[Y|X=x]$.

  对于分类任务，风险可以分解为 $ sR(f) = EE[abs(EE[Y|X])|bb(1)_((-oo,0))(EE[Y|X]f(X))] + sR^*, quad f in
  sM(sX, sY). $ 对应的贝叶斯最优函数，或者贝叶斯分类器为 $f^* (x) =
  sgn(EE[Y|X=x])$.
]
