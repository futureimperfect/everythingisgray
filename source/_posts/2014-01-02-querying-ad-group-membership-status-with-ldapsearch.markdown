---
layout: post
title: "Querying AD Group Membership Status with ldapsearch"
date: 2014-01-02 22:35
published: true
comments: true
categories: 
- OS X
- Unix
- Technology
tags:
- OS X
- Unix
- Technology
---

Here's a way to query Active Directory for group membership with the `ldapsearch` utility. In my case, this was used to check if a user is authorized before attempting to mount an SMB share at login on OS X clients. The `-Q` option causes `ldapsearch` to use [SASL][1] quiet mode and not prompt for a password, which works if a [Kerberos][2] ticket is present.

{% gist 8253239 %}

[1]: http://en.wikipedia.org/wiki/Simple_Authentication_and_Security_Layer
[2]: http://web.mit.edu/~kerberos/
