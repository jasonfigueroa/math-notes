[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

$repositoryRoot = [System.IO.Path]::GetFullPath($PSScriptRoot)
$outputDirectory = [System.IO.Path]::GetFullPath(
    (Join-Path $repositoryRoot 'build')
)
$expectedOutputDirectory = Join-Path $repositoryRoot 'build'

if ($outputDirectory -ne $expectedOutputDirectory) {
    throw "Refusing to clean unexpected path: $outputDirectory"
}

if (Test-Path -LiteralPath $outputDirectory) {
    Remove-Item -LiteralPath $outputDirectory -Recurse -Force
    Write-Host "Removed $outputDirectory"
}
else {
    Write-Host 'Nothing to clean.'
}
