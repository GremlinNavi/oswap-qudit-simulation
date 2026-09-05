. "$PSScriptRoot/../src/OSWAP-QuditSimulation.ps1"

# Thesis demonstration:
# qudit=(PEMDAS) -> deterministic d -> context-specific interpretation.
# Here d is interpreted as a classical LLM routing/configuration dimension.
Invoke-OswapLlmDimensionDemo -Expression '(3*4)'
