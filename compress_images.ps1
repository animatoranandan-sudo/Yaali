
# Compress-Images.ps1
# Recursively finds images and compresses them using .NET System.Drawing

Add-Type -AssemblyName System.Drawing

function Compress-Image {
    param (
        [string]$FilePath,
        [int]$Quality = 75,
        [int]$MaxWidth = 1920,
        [bool]$ConvertToJpg = $false
    )

    try {
        $image = [System.Drawing.Image]::FromFile($FilePath)
        
        # Calculate new dimensions
        $newWidth = $image.Width
        $newHeight = $image.Height

        if ($image.Width -gt $MaxWidth) {
            $scaleFactor = $MaxWidth / $image.Width
            $newWidth = [int]($image.Width * $scaleFactor)
            $newHeight = [int]($image.Height * $scaleFactor)
        }

        $bitmap = new-object System.Drawing.Bitmap $newWidth, $newHeight
        $graph = [System.Drawing.Graphics]::FromImage($bitmap)
        $graph.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        $graph.DrawImage($image, 0, 0, $newWidth, $newHeight)
        
        # Save to temp file
        $tempFile = $FilePath + ".tmp"
        $isJpg = $false

        if ($ConvertToJpg -or ($FilePath -match "\.jpg$") -or ($FilePath -match "\.jpeg$")) {
            $codec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq "image/jpeg" }
            $encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
            $encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, $Quality)
            $bitmap.Save($tempFile, $codec, $encoderParams)
            $isJpg = $true
        }
        else {
            $bitmap.Save($tempFile, [System.Drawing.Imaging.ImageFormat]::Png)
        }
        
        $image.Dispose()
        $bitmap.Dispose()
        $graph.Dispose()

        # Replace original
        Remove-Item $FilePath
        
        if ($isJpg -and $FilePath -match "\.png$") {
            $newPath = [System.IO.Path]::ChangeExtension($FilePath, ".jpg")
            Move-Item $tempFile $newPath -Force
            Write-Host "Converted to JPG: $FilePath -> $newPath"
        }
        else {
            Move-Item $tempFile $FilePath -Force
            Write-Host "Compressed: $FilePath"
        }
    }
    catch {
        Write-Host "Error compressing $FilePath : $_"
    }
}

# Process all images
$images = Get-ChildItem -Path "y:\WEBSITE\KarmaRebelsPitch\images" -Include *.png, *.jpg, *.jpeg -Recurse

foreach ($img in $images) {
    # If in Assets folder, convert to JPG for size (unless it's already jpg)
    if ($img.FullName -match "images\\Assets" -and $img.Extension -eq ".png") {
        Compress-Image -FilePath $img.FullName -Quality 75 -ConvertToJpg $true
    }
    # For others, just compress/resize if large
    elseif ($img.Length -gt 500KB) {
        Compress-Image -FilePath $img.FullName -Quality 75 -ConvertToJpg $false
    }
}
