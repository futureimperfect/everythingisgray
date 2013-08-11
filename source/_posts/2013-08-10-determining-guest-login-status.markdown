---
layout: post
title: "Determining Guest Login Status"
date: 2013-08-10 23:51
comments: true
categories: 
- OS X
- Technology
tags:
- OS X
- Technology
---

The other day I was presented with the challenge of determining whether Guest login was enabled on 150+ Macs. Fortunately, my client was using the [Casper Suite][1], so I was able to whip up an Extension Attribute rather quickly. Here's what I came up with to get the status:

{% gist 6203175 %}

[1]: http://www.jamfsoftware.com/software/casper-suite
