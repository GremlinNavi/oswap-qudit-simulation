. "$PSScriptRoot\..\src\OSWAP-QuditSimulation.ps1"

$Expression = '(9/3)'

Resolve-OswapExpression -Expression $Expression
Invoke-OswapGitDemo -Expression $Expression
Invoke-OswapQuantumDigitDemo -Expression $Expression
