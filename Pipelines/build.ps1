# Add Madcap to path
# $env:PATH += ";C:\Program Files\MadCap Software\MadCap Flare 19\Flare.app"

#Set-Location ../

# build the web help
madbuild -project ".\ESMS.flprj" -target "ESMS-Web-Reorg-2023"

madbuild -project ".\ESMS.flprj" -target "ESMS-PDF-Reorg-2023"