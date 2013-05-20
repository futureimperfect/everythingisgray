---
author: admin
comments: true
date: 2009-10-08 19:52:41
layout: post
slug: check-if-your-mac-is-64-bit
title: Check if your Mac is 64 bit
wordpress_id: 149
categories:
- OS X
- Technology
tags:
- OS X
- Snow Leopard
---

Here's an easy way to determine whether or not your Mac is 64 bit capable. Open `Terminal.app`, which is located in `/Applications/Utilities` and type in

`sysctl hw |grep 64bit`.

If your machine is 64 bit capable, the result will be

`hw.cpu64bit_capable: 1`

If your machine is not 64 bit capable, the result will be

`hw.cpu64bit_capable: 0`

Tip source: [OSXDaily.com](http://osxdaily.com/2009/09/23/check-if-your-mac-is-64-bit-compatible-via-command-line/)
