# Creates a Crossfade shortcut with its own icon on your desktop.
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$desktop = [Environment]::GetFolderPath('Desktop')
$sh = New-Object -ComObject WScript.Shell
$lnk = $sh.CreateShortcut((Join-Path $desktop 'Crossfade.lnk'))
$lnk.TargetPath = 'powershell.exe'
$lnk.Arguments = "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File `"$root\Crossfade.ps1`""
$lnk.WorkingDirectory = $root
$lnk.IconLocation = "$root\icon.ico"
$lnk.WindowStyle = 7
$lnk.Save()
Write-Host "Shortcut created on your desktop."
