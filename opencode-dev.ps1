param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Prompt,

    [string]$Branch = "opencode/$(Get-Date -Format 'yyyyMMdd-HHmmss')"
)

$ErrorActionPreference = 'Stop'
$repo = $PSScriptRoot
$nodeFolder = Get-ChildItem "$repo\.tools\node" -Directory -Filter 'node-v*-win-x64' -ErrorAction SilentlyContinue | Select-Object -First 1
$openCode = "$repo\.tools\opencode\opencode.cmd"

if (-not $nodeFolder -or -not (Test-Path $openCode)) {
    throw 'OpenCode no esta instalado. Ejecuta la instalacion indicada en la documentacion del proyecto.'
}

if (-not (Test-Path (Join-Path $repo '.git'))) {
    throw 'Ejecuta este script desde la raiz de un repositorio Git.'
}

Push-Location $repo
try {

$status = git status --porcelain
if ($status) {
    throw 'El repositorio tiene cambios sin guardar. Haz commit o guardalos antes de iniciar una tarea nueva.'
}

$branch = $Branch -replace '[^a-zA-Z0-9/_-]', '-'
git switch -c $branch

$env:PATH = "$($nodeFolder.FullName);$($nodeFolder.FullName)\node_modules\npm\bin;$env:PATH"
& $openCode run --agent build --auto $Prompt
if ($LASTEXITCODE -ne 0) {
    throw "OpenCode termino con codigo $LASTEXITCODE. La rama local se conserva para revisar los cambios."
}

git diff --check
git status --short
$answer = Read-Host 'Publicar esta rama para que la audite GitHub Actions? (s/n)'
if ($answer -notmatch '^(s|si|y|yes)$') {
    Write-Host "Cambios conservados en la rama $branch."
    exit 0
}

git add -A
git commit -m "Implementar tarea con OpenCode"
git push --set-upstream origin $branch
Write-Host "Rama publicada: $branch"
Write-Host 'La auditoria se ejecutara en GitHub Actions sobre este push.'
}
finally {
    Pop-Location
}
