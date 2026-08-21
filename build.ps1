[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

$repositoryRoot = $PSScriptRoot
$outputDirectory = Join-Path $repositoryRoot 'build'

$documents = @(
    [pscustomobject]@{
        Name = 'algebra'
        Source = 'algebra/main.tex'
    }
    [pscustomobject]@{
        Name = 'discrete-structures'
        Source = 'discrete-structures/main.tex'
    }
)

if (-not (Get-Command pdflatex -ErrorAction SilentlyContinue)) {
    throw 'pdflatex was not found on PATH. Install MiKTeX or another LaTeX distribution, then open a new terminal.'
}

New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null

Push-Location $repositoryRoot
try {
    foreach ($document in $documents) {
        Write-Host "Building $($document.Name).pdf"

        for ($pass = 1; $pass -le 2; $pass++) {
            & pdflatex `
                -interaction=nonstopmode `
                -halt-on-error `
                -file-line-error `
                "-output-directory=$outputDirectory" `
                "-jobname=$($document.Name)" `
                $document.Source

            if ($LASTEXITCODE -ne 0) {
                throw "pdflatex failed while building $($document.Name).pdf on pass $pass."
            }
        }
    }
}
finally {
    Pop-Location
}

Write-Host "Built PDFs in $outputDirectory"
