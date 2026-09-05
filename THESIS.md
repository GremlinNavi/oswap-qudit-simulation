# OSWAP Qudit Thesis

## Thesis

```text
qudit=(PEMDAS)
```

OSWAP treats a restricted arithmetic expression as a human-readable, deterministic way to resolve a dimension `d`.

```text
qudit=(9/3)
      ↓
      3
      ↓
     d=3
```

The resolved integer is a typed parameter. In a quantum context it can describe a qudit dimension. In another OSWAP subsystem, the same arithmetic layer can parameterize a different d-level structure.

## Core claim

`qudit=(PEMDAS)` is proposed as a deterministic addressing and parameterization interface for d-dimensional computational structures.

```text
human-readable expression
        ↓
restricted deterministic parser
        ↓
resolved value d
        ↓
domain-specific interpretation
```

Possible experimental interpretations include:

- qudit dimension;
- classical multi-state control spaces;
- LLM routing/configuration dimensions;
- expert or tool-selection cardinality;
- simulator parameters such as shot counts; and
- other typed OSWAP parameters.

## LLM research hypothesis

The hypothesis is not that PEMDAS performs quantum computation. It is that a common, auditable expression language could let a human or model specify d-level computational structures while preserving both the original expression and its deterministic resolution.

Example:

```text
qudit=(3*4) -> d=12
```

An LLM adapter could interpret `d=12` as twelve logical routing states, twelve expert slots, or another explicitly typed configuration. A future quantum adapter could interpret the same resolved value as a 12-level qudit dimension.

This creates a stable boundary between natural-language intent, deterministic configuration, and domain-specific execution.

## Scientific boundary

The current repository is classical software. It does not simulate amplitudes, phases, superposition, entanglement, unitary evolution, measurement, or quantum hardware.

```text
PEMDAS != quantum computation
```

The current defensible claim is:

> OSWAP can resolve restricted human-readable arithmetic expressions into deterministic d-level parameters and expose those parameters to independently implemented computational domains.

## Research context

Higher-dimensional quantum systems are an active research area. In 2026, researchers demonstrated coherent control and algorithms in a 25-level trapped-ion qudit. Qutrit-based neural quantum kernel research has also explored richer multi-level embeddings for classification.

These results motivate experimentation; they do not establish that OSWAP improves LLMs or quantum computation.

References:

- Low et al., "Quantum logic operations and algorithms in a single 25-level atomic qudit," Nature Communications (2026): https://www.nature.com/articles/s41467-026-72662-8
- Cristiano-Romero et al., "Qutrit-Based Neural Quantum Kernels for Classification Tasks" (2026): https://arxiv.org/abs/2607.23683

## Falsifiable development questions

1. Can independent OSWAP adapters resolve identical expressions to identical typed values?
2. Does preserving the original expression improve auditability over opaque numeric configuration alone?
3. Can d-level parameters usefully control LLM routing or tool-selection experiments without conflating logical states with quantum states?
4. Can a future genuine qudit simulator consume the same typed parameter contract without changing expression semantics?
5. Where does this abstraction add measurable value, and where is a plain integer configuration simpler?
