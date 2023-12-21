try {
    # build the web help
    madbuild -project ".\ESMS.flprj" -target "ESMS-Web-Reorg-2023"
    if ($LASTEXITCODE) { Throw "Build Web Help Failed." }

    madbuild -project ".\ESMS.flprj" -target "ESMS-PDF-Reorg-2023"
    if ($LASTEXITCODE) { Throw "Build PDF Help Failed." }

    if (Test-Path $ARTIFACT_PATH) { New-Item $ARTIFACT_PATH -ItemType "directory" }

    $outputDirectories = ".\Output\Gitlab-Runner\"

    $subdirectories = Get-ChildItem -Path $outputDirectories -Directory

    foreach ($subdirectory in $subdirectories) {
        Copy-Item -Path $subdirectory.FullName -Destination $ARTIFACT_PATH -Recurse
    }
}
Catch {
    Write-Host "An error occurred: $($_.Exception.Message)"
    exit 1
}