# OSWAP Qudit Simulation

OSWAP Qudit Simulation is a classical PowerShell proof of concept for mapping restricted, auditable arithmetic expressions onto qudit-style configuration values.

## Scope

This repository does not perform quantum computation and does not claim quantum-hardware performance. Its current role is to explore how OSWAP expressions can describe values such as a qudit dimension, shot count, iteration count, or simulator parameter while preserving the original human-readable expression.

Example:

```text
(9/3) -> 3 -> qutrit / dimension d = 3
```

The same resolved value can also be interpreted by another OSWAP subsystem, such as a repository-allocation adapter.

## Repository layout

- `src/OSWAP-QuditSimulation.ps1` — current PowerShell proof-of-concept functions.
- `examples/basic-demo.ps1` — minimal usage example.
- `docs/OSWAP_PEMDAS_Quantum_Demo.txt` — preserved design/demo artifact.
- `scripts/Push-OSWAPQuditBuild.ps1` — preflight-first helper for mirrored GitHub/GitLab publication.
- `.oswap/mirrors.json` — intended mirror endpoints.

## Current safety boundary

The demonstration accepts only a deliberately small arithmetic character set before evaluation. The source remains proof-of-concept code. A production OSWAP implementation should replace `Invoke-Expression` with a dedicated arithmetic parser/AST and explicitly reject commands, property access, method calls, file operations, network operations, and arbitrary PowerShell syntax.

## Running the demo

```powershell
. .\src\OSWAP-QuditSimulation.ps1
Invoke-OswapQuantumDigitDemo -Expression '(9/3)'
```

Expected interpretation: dimension `3`, or a qutrit, with basis states `|0>`, `|1>`, and `|2>`.

## Mirrored build workflow

Preview a publication:

```powershell
.\scripts\Push-OSWAPQuditBuild.ps1
```

Publish only after reviewing the preflight:

```powershell
.\scripts\Push-OSWAPQuditBuild.ps1 -Publish
```

The helper intentionally avoids force-push behavior.
