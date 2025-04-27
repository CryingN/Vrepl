# Vrepl

**by:CryingN**

中文|[English](./README.md)

以下是一个实验性的Vrepl, 为了方便重构, 我们实现了以下功能方便与官方Vrepl程序进行更换, 为了便于区分, 使用当前仓库的程序时V的标志更换为红色.

## 实现功能

### 帮助

以下是`make.v`实现的功能, 为保持简洁, 若无需要不会进行调整

```

Vrepl [version], By: CryingN.
Basic usages:
 v run make.v [Options]
 v make.v; ./make [Options]
Options:
 -h, -help                              Show basic help message and exit.
 -v, --version                          Show version and exit.
 -u, --up                               Update vlang & Vrepl.
 -c, --clean                            Restore original vrepl.
```

### 版本号

可以通过`v run make.v -v`查询当前版本号.

### 更新

可以通过`v run make.v -u`将当前的实验性Vrepl更新到最新版本.

### 移除

可以通过`v run make.v -c`移除当前的实验性Vrepl, 不会对vlang语言本身造成影响.

## 解决问题

我们列出了拉取这个仓库试图解决的问题:

### 时效性问题

vlang自带的Vrepl不会对信息进行记忆, 每次输出需要重新进行编译, 我们希望能让程序直接获取变量信息, 解决类似以下类型的错误:

```v
>>> a := time.now()
>>> a
2025-04-27 12:51:32
>>> a
2025-04-27 12:51:34
```

### 返还文件问题

原Vrepl提供了list查看当前存储的数据信息, 但是无法将数据信息直接生成文件, 我们想试图解决将Vrepl中的数据信息直接生成规范的相应文件.

### 反馈混乱问题例如

因为语言特性, 在一些特殊情况下会出现一些混乱的情况, 例如以下类型:

```v
>>> mut i := 1
>>> println(i++)
warning: `++` operator can only be used as a statement
    6 |
    7 | mut i := 1
    8 | println(i++)
      |          ~~
1
>>> i
  9 | println(i)
1
2
>>> i
0 | println(i)
1
2
2
```


