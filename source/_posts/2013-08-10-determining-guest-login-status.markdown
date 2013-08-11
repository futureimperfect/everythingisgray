The other day I was presented with the challenge of determining whether Guest login was enabled on 150+ Macs. Fortunately, my client was using the Casper Suite, so I was able to whip up an Extension Attribute rather quickly. Here's what I came up with to get the status:

{% gist 6203175 %}

Running this command will return 1 if Guest login is enabled and 0 if not.
