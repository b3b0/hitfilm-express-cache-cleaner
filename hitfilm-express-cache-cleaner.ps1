$FirstTimelineCachePath = "$env:LOCALAPPDATA\FXHOME\HitFilm\cache\Timeline\Files"
$FirstMediaCachePath = "$env:LOCALAPPDATA\FXHOME\HitFilm\cache\Media\Files"
$ProxiesPath = "$env:LOCALAPPDATA\FXHOME\HitFilm Express\Proxies\"
$SecondTimelineCachePath = "$env:LOCALAPPDATA\FXHOME\HitFilm Express\cache\Timeline\Files"
$SecondMediaCachePath = "$env:LOCALAPPDATA\FXHOME\HitFilm Express\cache\Media\Files"

function Clear-Directory {
    param([string]$Path)

    Get-ChildItem -Path $Path -Force | Remove-Item -Force -Recurse
}

function Clear-Cache {
    param([string]$Path, [string]$CacheName)

    if (Test-Path $Path -PathType Container) {
        Clear-Directory $Path
        Write-Host "$CacheName cache has been cleared."
    } else {
        Write-Host "$CacheName cache directory not found. Nothing to clear."
    }
}

Clear-Cache -Path $FirstTimelineCachePath -CacheName "First timeline"
Clear-Cache -Path $FirstMediaCachePath -CacheName "First media"
Clear-Cache -Path $ProxiesPath -CacheName "Proxy"
Clear-Cache -Path $SecondTimelineCachePath -CacheName "Second timeline"
Clear-Cache -Path $SecondMediaCachePath -CacheName "Second media"
