param([int]$Port = 8888)
# Crossfade launcher: serves the app on this computer and opens it in its own window.
Add-Type -AssemblyName PresentationFramework
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$url = "http://127.0.0.1:$Port/"

$candidates = @(
  "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe",
  "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe",
  "$env:ProgramFiles\Google\Chrome\Application\chrome.exe",
  "${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe",
  "$env:LOCALAPPDATA\Google\Chrome\Application\chrome.exe"
)
$browser = $candidates | Where-Object { $_ -and (Test-Path $_) } | Select-Object -First 1
if (-not $browser) {
  [System.Windows.MessageBox]::Show("Crossfade needs Microsoft Edge or Google Chrome installed.", "Crossfade") | Out-Null
  exit 1
}

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($url)
try { $listener.Start() } catch {
  [System.Windows.MessageBox]::Show("Crossfade could not start because port $Port is already in use. Close any other copy of Crossfade and try again.", "Crossfade") | Out-Null
  exit 1
}

$profile = Join-Path $env:LOCALAPPDATA 'Crossfade\profile'
$args = @("--app=$url", "--user-data-dir=`"$profile`"", "--window-size=1280,820", "--no-first-run", "--no-default-browser-check")
$proc = Start-Process -FilePath $browser -ArgumentList $args -PassThru

$types = @{ '.html'='text/html; charset=utf-8'; '.js'='text/javascript'; '.css'='text/css'; '.svg'='image/svg+xml'; '.png'='image/png'; '.ico'='image/x-icon' }
$pending = $listener.BeginGetContext($null, $null)
while (-not $proc.HasExited) {
  if ($pending.AsyncWaitHandle.WaitOne(400)) {
    $ctx = $listener.EndGetContext($pending)
    $pending = $listener.BeginGetContext($null, $null)
    try {
      $path = $ctx.Request.Url.LocalPath
      if ($path -eq '/') { $path = '/index.html' }
      $file = Join-Path $root (($path.TrimStart('/')) -replace '/', '\')
      if ((Test-Path $file -PathType Leaf) -and ((Resolve-Path $file).Path.StartsWith($root))) {
        $bytes = [System.IO.File]::ReadAllBytes($file)
        $ext = [System.IO.Path]::GetExtension($file).ToLower()
        if ($types.ContainsKey($ext)) { $ctx.Response.ContentType = $types[$ext] } else { $ctx.Response.ContentType = 'application/octet-stream' }
        $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length)
      } else { $ctx.Response.StatusCode = 404 }
    } catch {}
    try { $ctx.Response.Close() } catch {}
  }
}
$listener.Stop()
