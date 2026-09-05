# OSWAP Qudit Simulation

OSWAP Qudit Simulation is a classical PowerShell proof of concept for mapping restricted, auditable arithmetic expressions onto qudit-style configuration values and other OSWAP parameters.

> Scientific scope: the current implementation does not simulate quantum state evolution and does not perform quantum computation. It resolves arithmetic expressions into deterministic values that can be interpreted as quantum-system configuration metadata, such as a qudit dimension.

## Research thesis

The current research thesis is:

```text
qudit=(PEMDAS)
```

A restricted human-readable arithmetic expression resolves deterministically to a typed dimension `d`, after which an independent domain adapter assigns meaning to that value. See [THESIS.md](THESIS.md) for the claim boundary, LLM research hypothesis, references, and falsifiable questions.

## What this project currently demonstrates

The proof of concept implements a small semantic pipeline:

```text
human-readable OSWAP expression
        ↓
restricted arithmetic evaluation
        ↓
deterministic resolved value
        ↓
context-specific interpretation
        ↓
qudit dimension / repository target count / future OSWAP parameter
```

For example:

```text
(9/3) -> 3 -> dimension d = 3 -> qutrit configuration
```

The resolved value `3` is not itself a quantum state. In the quantum-digit demonstration, OSWAP interprets it as the Hilbert-space dimension `d = 3` and labels the corresponding computational basis states:

```text
|0>
|1>
|2>
```

The same arithmetic expression can be interpreted differently by another OSWAP subsystem. For example, a repository-allocation adapter can interpret the resolved value as a publication-target count rather than a qudit dimension.

This makes the current experiment primarily a test of OSWAP as a shared, human-readable parameter language rather than a quantum simulator.

## Qudit terminology

A qudit is a `d`-level quantum information unit. A qubit has `d = 2`; a qutrit has `d = 3`; higher-dimensional systems are commonly described as qudits.

The current OSWAP demonstration uses this terminology only to describe configuration metadata:

```text
Expression: (9/3)
Resolved value: 3
Interpretation: d = 3
Label: qutrit
Basis labels: |0>, |1>, |2>
```

No amplitudes, phases, superpositions, entanglement, unitary gates, measurements, or quantum-hardware operations are simulated by the current code.

## What this is not

The current repository does not demonstrate:

- quantum computation;
- quantum advantage or quantum speedup;
- physical qudit hardware;
- arbitrary quantum-circuit simulation;
- state-vector evolution;
- entanglement simulation;
- measurement-probability calculation; or
- constant-cost simulation of general quantum systems.

The current proof of concept is computationally inexpensive because it performs restricted classical arithmetic and produces configuration labels. That low cost must not be confused with the cost of classically simulating a general quantum system.

## What a true classical qudit-state simulator would require

A future OSWAP component could become a genuine classical qudit simulator, but that would require additional mathematical machinery beyond the current proof of concept.

At minimum, a single-qudit state simulator would need to represent a normalized complex state vector of length `d`:

```text
|psi> = alpha_0|0> + alpha_1|1> + ... + alpha_(d-1)|d-1>
```

with:

```text
sum_i |alpha_i|^2 = 1
```

It would also need defined operations for areas such as:

- complex amplitudes and phase;
- normalization;
- unitary transformations / gates;
- measurement probabilities;
- shot-based sampling; and
- validation of state and operator dimensions.

For multiple qudits, a full state-vector representation grows as:

```text
d^n
```

where `d` is the level count and `n` is the number of qudits. Accordingly, a future full-state simulator would not generally have "next to no" compute cost. The current project avoids that scaling because it does not yet represent quantum amplitudes or multi-qudit state vectors.

## OSWAP parameter-language experiment

One goal of this repository is to test whether the same restricted expression grammar can be reused across different OSWAP contexts while preserving the original human-readable expression.

Conceptually:

```text
qudit=(9/3)  -> 3 -> interpret as d = 3

twin=(9/3)   -> 3 -> interpret as 3 publication targets

shots=(9/3)  -> 3 -> potentially interpret as 3 simulator shots

qudit=(3*4)  -> 12 -> experimentally expose d = 12 to an LLM routing/configuration adapter
```

The arithmetic layer can therefore remain deterministic while meaning is assigned by the receiving subsystem.

This separation is important: expression resolution and domain interpretation are different operations.

## Current implementation

The present PowerShell implementation contains:

- `Test-OswapArithmeticExpression` — restricts the proof-of-concept input character set;
- `Resolve-OswapExpression` — resolves the restricted arithmetic expression;
- `Invoke-OswapGitDemo` — interprets the result as a repository publication-target count; and
- `Invoke-OswapQuantumDigitDemo` — interprets the result as a qudit dimension and prints basis-state labels.
- `Invoke-OswapLlmDimensionDemo` — interprets the result as a classical LLM routing/configuration dimension and prints logical state labels without performing inference or quantum computation.

Example:

```powershell
. .\src\OSWAP-QuditSimulation.ps1
Invoke-OswapQuantumDigitDemo -Expression '(9/3)'
```

Expected interpretation:

```text
Original expression : (9/3)
Resolved dimension  : 3
Quantum digit type  : qutrit

Basis states:
  |0>
  |1>
  |2>

This is a classical configuration demonstration.
No quantum computation was performed.
```

An additional classical LLM-dimension example is available in `examples/llm-dimension-demo.ps1`.

## Safety boundary

The demonstration accepts only a deliberately small arithmetic character set before evaluation.

The source remains proof-of-concept code. It currently uses `Invoke-Expression` after input filtering. A production OSWAP implementation should replace this with a dedicated arithmetic parser / abstract syntax tree and explicitly reject:

- arbitrary PowerShell commands;
- property access;
- method calls;
- variable expansion outside the grammar;
- file operations;
- network operations; and
- other executable PowerShell syntax.

The long-term objective should be a grammar that parses arithmetic directly rather than passing user-supplied expressions to a general-purpose shell evaluator.

## Repository layout

- `THESIS.md` — `qudit=(PEMDAS)` thesis, scientific boundary, and LLM research hypothesis.
- `src/OSWAP-QuditSimulation.ps1` — current PowerShell proof-of-concept functions.
- `examples/basic-demo.ps1` — minimal usage example.
- `examples/llm-dimension-demo.ps1` — classical d-level LLM routing/configuration example.
- `docs/OSWAP_PEMDAS_Quantum_Demo.txt` — preserved design/demo artifact.
- `scripts/Push-OSWAPQuditBuild.ps1` — preflight-first helper for mirrored GitHub/GitLab publication.
- `.oswap/mirrors.json` — intended mirror endpoints.

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

## Development direction

Near-term technical milestones for the quantum-related branch of this experiment include:

1. replace `Invoke-Expression` with a dedicated arithmetic parser / AST;
2. formalize the OSWAP expression grammar and type constraints;
3. distinguish syntax resolution from domain-specific interpretation in code;
4. add tests for invalid, fractional, negative, and oversized dimensions;
5. define an explicit qudit-state data structure if actual state simulation is pursued;
6. add normalized complex amplitudes and unitary operators before describing the software as a qudit-state simulator; and
7. document classical complexity and memory scaling for any future multi-qudit implementation.
8. benchmark whether typed d-level parameters provide measurable value in classical LLM routing, tool selection, or expert-selection experiments compared with plain numeric configuration.

## Claim boundary

The technically accurate description of the current project is:

> A classical PowerShell proof of concept that resolves restricted OSWAP arithmetic expressions into deterministic values and demonstrates how those values can be interpreted as qudit dimensions or other typed configuration parameters.

If future versions implement normalized complex state vectors, quantum operators, measurement, and state evolution, the project can then make a stronger and more conventional claim to classical qudit simulation.
