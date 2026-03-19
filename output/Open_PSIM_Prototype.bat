@echo off
title ECC PSIM Prototype
echo Starting PSIM Prototype server...
echo.
echo Once the browser opens, the prototype will be at:
echo   http://localhost:8080/ECC_PSIM_Prototype.html
echo.
echo Keep this window open. Press Ctrl+C to stop.
echo.
cd /d "%~dp0"
powershell -ExecutionPolicy Bypass -Command "$listener = [System.Net.HttpListener]::new(); $listener.Prefixes.Add('http://localhost:8080/'); $listener.Start(); Start-Process 'http://localhost:8080/ECC_PSIM_Prototype.html'; Write-Host 'Server running... Press Ctrl+C to stop.'; while ($listener.IsListening) { $ctx = $listener.GetContext(); $file = $ctx.Request.Url.LocalPath.TrimStart('/'); if ([string]::IsNullOrEmpty($file)) { $file = 'ECC_PSIM_Prototype.html' }; $path = Join-Path '%~dp0' $file; if (Test-Path $path) { $bytes = [System.IO.File]::ReadAllBytes($path); $ctx.Response.ContentType = 'text/html'; $ctx.Response.ContentLength64 = $bytes.Length; $ctx.Response.OutputStream.Write($bytes, 0, $bytes.Length) } else { $ctx.Response.StatusCode = 404 }; $ctx.Response.Close() }"
