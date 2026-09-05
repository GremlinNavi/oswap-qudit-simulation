Set-StrictMode -Version Latest

function Test-OswapArithmeticExpression {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Expression
    )

    # Proof-of-concept grammar only. Production code should use a parser/AST.
    if ($Expression -notmatch '^[0-9\.\+\-\*\/%\(\)\s]+$') {
        throw 'Expression contains unsupported characters.'
    }

    return $true
}

function Resolve-OswapExpression {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Expression
    )

    Test-OswapArithmeticExpression -Expression $Expression | Out-Null

    # Demonstration only: the whitelist above is intentionally tiny.
    # Replace Invoke-Expression with a dedicated arithmetic parser for production.
    $Result = Invoke-Expression $Expression

    [pscustomobject]@{
        Expression = $Expression
        Result     = $Result
    }
}

function Invoke-OswapGitDemo {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Expression
    )

    $Resolved = Resolve-OswapExpression -Expression $Expression

    if ($Resolved.Result -lt 1) {
        throw 'Git target count must resolve to at least 1.'
    }

    if ($Resolved.Result -ne [math]::Floor([double]$Resolved.Result)) {
        throw 'Git target count must resolve to a whole number.'
    }

    $TargetCount = [int]$Resolved.Result

    Write-Host ''
    Write-Host 'OSWAP Git allocation demonstration'
    Write-Host '----------------------------------'
    Write-Host "Original expression : $($Resolved.Expression)"
    Write-Host "Resolved value      : $TargetCount"
    Write-Host "Meaning             : Select $TargetCount publication target(s)"
    Write-Host ''
    Write-Host 'No repository was modified.'
}

function Invoke-OswapQuantumDigitDemo {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Expression
    )

    $Resolved = Resolve-OswapExpression -Expression $Expression

    if ($Resolved.Result -lt 2) {
        throw 'Quantum digit dimension must be at least 2.'
    }

    if ($Resolved.Result -ne [math]::Floor([double]$Resolved.Result)) {
        throw 'Quantum digit dimension must resolve to a whole number.'
    }

    $Dimension = [int]$Resolved.Result

    switch ($Dimension) {
        2 { $QuantumDigitName = 'qubit' }
        3 { $QuantumDigitName = 'qutrit' }
        4 { $QuantumDigitName = '4-level qudit' }
        default { $QuantumDigitName = "$Dimension-level qudit" }
    }

    Write-Host ''
    Write-Host 'OSWAP quantum-digit configuration demonstration'
    Write-Host '------------------------------------------------'
    Write-Host "Original expression : $($Resolved.Expression)"
    Write-Host "Resolved dimension  : $Dimension"
    Write-Host "Quantum digit type  : $QuantumDigitName"
    Write-Host ''
    Write-Host 'Basis states:'

    for ($i = 0; $i -lt $Dimension; $i++) {
        Write-Host "  |$i>"
    }

    Write-Host ''
    Write-Host 'This is a classical configuration demonstration.'
    Write-Host 'No quantum computation was performed.'
}

function Invoke-OswapLlmDimensionDemo {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Expression
    )

    $Resolved = Resolve-OswapExpression -Expression $Expression

    if ($Resolved.Result -lt 2) {
        throw 'LLM dimension must resolve to at least 2.'
    }

    if ($Resolved.Result -ne [math]::Floor([double]$Resolved.Result)) {
        throw 'LLM dimension must resolve to a whole number.'
    }

    $Dimension = [int]$Resolved.Result

    Write-Host ''
    Write-Host 'OSWAP LLM dimension-mapping demonstration'
    Write-Host '----------------------------------------'
    Write-Host "Original expression : $($Resolved.Expression)"
    Write-Host "Resolved dimension  : $Dimension"
    Write-Host "Interpretation       : $Dimension logical routing/configuration states"
    Write-Host ''
    Write-Host 'Logical state labels:'

    for ($i = 0; $i -lt $Dimension; $i++) {
        Write-Host "  state[$i]"
    }

    Write-Host ''
    Write-Host 'This is a classical parameterization demonstration.'
    Write-Host 'No LLM inference, quantum state evolution, or quantum computation was performed.'
}
