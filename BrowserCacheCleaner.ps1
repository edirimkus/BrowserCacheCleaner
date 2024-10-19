# Function to clear Chrome cache
function Clear-ChromeCache {
    $chromeCachePath = "$env:LOCALAPPDATA\Google\Chrome\User Data\Default\Cache"
    if (Test-Path $chromeCachePath) {
        Remove-Item $chromeCachePath\* -Recurse -Force
        Write-Output "Chrome cache cleared."
    } else {
        Write-Output "Chrome cache path not found."
    }
}

# Function to clear Firefox cache
function Clear-FirefoxCache {
    $firefoxCachePath = "$env:APPDATA\Mozilla\Firefox\Profiles"
    $profiles = Get-ChildItem $firefoxCachePath
    foreach ($profile in $profiles) {
        $cachePath = "$profile\cache2"
        if (Test-Path $cachePath) {
            Remove-Item $cachePath\* -Recurse -Force
            Write-Output "Firefox cache cleared for profile $profile."
        } else {
            Write-Output "Firefox cache path not found for profile $profile."
        }
    }
}

# Function to clear Edge cache
function Clear-EdgeCache {
    $edgeCachePath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data\Default\Cache"
    if (Test-Path $edgeCachePath) {
        Remove-Item $edgeCachePath\* -Recurse -Force
        Write-Output "Edge cache cleared."
    } else {
        Write-Output "Edge cache path not found."
    }
}

# Clear cache for all browsers
Clear-ChromeCache
Clear-FirefoxCache
Clear-EdgeCache

Write-Output "Browser caches cleared successfully."
