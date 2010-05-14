# find-string.vim #

This script is just a provider for the PowerShell 
[find-string](http://github.com/drmohundro/Find-String)
script, that is itself an homage to the 
[ack](http://search.cpan.org/~petdance/ack/ack). In fact, this script is 
based *heavily* on the [ack.vim script](http://github.com/mileszs/ack.vim/). 
The grepprg and grepformat parts of the script were copied over with variables
renamed. I can only take credit for the setting of the shell to powershell. 
So, thanks to all of the aforementioned projects.

Because this script just forwards calls to the PowerShell script, this will
only work on the Windows platform, at least unless there is ever a Mono version
of PowerShell. If you want this functionality on other platforms, just use
ack.

## Need help?

Visit my [website](http://www.mohundro.com/blog) and shoot me a line.
