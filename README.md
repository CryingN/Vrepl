# Vrepl

**by: CryingN**

[中文](./README_CN.md) | English

Below is an experimental Vrepl. To facilitate refactoring, we've implemented the following features to allow easy replacement with the official Vrepl program. For distinction, the V logo will be displayed in red when using the program from this repository.

## Implemented Features

### Help

The following is the functionality implemented by `make.v`. To keep it concise, no adjustments will be made unless necessary.

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

### Version Check

You can query the current version number by running `v run make.v -v`.

### Update

You can update the current experimental Vrepl to the latest version by running `v run make.v -u`.

### Removal

You can remove the current experimental Vrepl by running `v run make.v -c`. This will not affect the vlang language itself.

## Issues Addressed

We've listed the problems this repository aims to resolve:

### Timeliness Issue

The built-in Vrepl in vlang does not retain information; each output requires recompilation. We aim to enable the program to directly access variable information, addressing errors similar to the following:

```v
>>> a := time.now()
>>> a
2025-04-27 12:51:32
>>> a
2025-04-27 12:51:34
```

### File Export Issue

The original Vrepl provides a `list` command to view currently stored data, but it cannot directly export this data to a file. We aim to resolve this by enabling the direct generation of standardized files from the data in Vrepl.

### Confusing Feedback Issue

Due to language characteristics, confusing situations can arise in certain edge cases, such as the following:

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

### Import Errors

The native Vrepl cannot import programs that specify function names. For example:

```v
>>> import os { input }
>>> input('>')
error: unknown function: input
```
