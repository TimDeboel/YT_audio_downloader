Get-ChildItem ".\Downloads" -Filter *.m4a -Recurse | where {$_.Name -match "[^\u0020-\u007F]"} | Rename-Item -NewName {$_.Name -replace "[^\u0020-\u007F]", "" } -ErrorAction Continue
Write-Host "Non-ASCII characters removed from filenames"