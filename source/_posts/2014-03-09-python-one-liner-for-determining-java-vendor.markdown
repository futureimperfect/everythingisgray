---
layout: post
title: "Python One-Liner for Determining Java Vendor"
date: 2014-03-09 21:51
published: true
comments: true
categories: 
- OS X
- Technology
- Python
---

Here's a Python one-liner that prints the Java vendor on OS X clients, (e.g., Apple or Oracle).

``` bash
python -c 'import os,plistlib; jv = plistlib.readPlist(os.path.join(os.path.realpath("/Library/Internet Plug-Ins/JavaAppletPlugin.plugin"), "Contents/Info.plist"))["CFBundleIdentifier"].split(".")[1]; print jv.capitalize()'
```

Why?

...Because we can.
