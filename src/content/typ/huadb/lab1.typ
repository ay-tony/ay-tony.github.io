#import "../../templates/post.typ": *

#show: post.with(
  title: "数据库实验 1. 页面组织与缓存管理",
  pub_date: (2025, 6, 28),
  upd_date: (2025, 6, 28),
  pub_time: (9, 36, 36),
  tags: ("数据库",),
  description: "",
)

简单记录一下思路，具体实现看代码。开一个 `lab1` 分支。

= 任务 1：变长记录的页面组织

== 步骤 1：记录插入

`Table::InsertRecord`：

+ 如果表里没有页面就插入新页面；
+ 遍历表中的所有页面，找到第一个有足够空间的页面，没有找到就新建一个；
+ 在目标页面中插入记录。

`TablePage::InsertRecord`：

+ 写入记录并更新 `upper`；
+ 写入 `slots` 并更新 `lower`；
+ 标记为 Dirty.

== 步骤 2：记录读取

`TableScan::GetNextRecord`：

+ 先定义函数【移动 `rid_` 至下一条记录】；
+ 找到当前及之后的第一条未删除的记录；
+ 如果遍历到结尾都没找到，直接返回 `nullptr`；
+ 否则读取对应的记录；
+ 移动 `rid_` 至下一条记录。

`TablePage::GetRecord`：

+ 通过 `slot_id` 获取 `offset`；
+ 反序列化 `record`；
+ 给 `record` 设置 `rid`（反序列化不会设置 `rid`）。

== 步骤 3：记录删除

直接打标记，略。

== 步骤 4：将 SimpleCatalog 替换为系统表 SystemCatalog

调整编译选项，略。

= 任务 2：LRU 缓存替换策略

因为缓存大小为 $5$，所以可以直接暴力。这里采用了哈希表+双向链表的形式，为扩展性考虑。

这个策略简单而言就是维护双向链表的顺序为最近访问的顺序，然后用哈希表维护每个 `frame_no` 对应在链表中的位置 `iterator`。这样 `Access` 和 `Evict` 都是 $O(1)$ 的。

= 高级功能

还没做。

