# find-string.vim #

This script is just a provider for the PowerShell 
[find-string](http://github.com/drmohundro/Find-String)
script, that is itself an homage to 
[ack](http://search.cpan.org/~petdance/ack/ack). In fact, this script is 
based *heavily* on the [ack.vim script](http://github.com/mileszs/ack.vim/). 
The grepprg and grepformat parts of the script were copied over with variables
renamed. I can only take credit for the setting of the shell to powershell. 
So, thanks to all of the aforementioned projects.

Because this script just forwards calls to the PowerShell script, this will
only work on the Windows platform, at least unless there is ever a Mono version
of PowerShell. If you want this functionality on other platforms, just use
ack.

## Installation ##

I recommend using pathogen for managing vim plugins, but otherwise, just drop
the ./plugin/find-string.vim file in your ~/.vim/plugin directory.

Another installation requirement for now is both files under ./lib
(find-string-wrapper.ps1 and ps-find-string.bat) should be in your PATH
somewhere. I'm sure there is a better way to do this (likely by having vim know
to execute these scripts where they exist), but I'm still learning. It works
for me. Maybe it will work for you!

## Usage ##

    :FindString {pattern} [{filetypes}]

So, if you wanted to search for 'command' in all .vim files, you would type
`:FindString command *.vim`.

## Need help?

Visit my [website](http://mohundro.com/) and shoot me a line.
