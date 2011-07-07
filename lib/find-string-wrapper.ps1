find-string @args -passthru | 
    out-string -width 120 | 
    foreach { $_.Trim() }
