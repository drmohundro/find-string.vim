$env:path += ';c:\Users\udmohun\Development\Find-String\'
find-string @args -passthru | 
    out-string -width 120 | 
    foreach { $_.Trim() }
