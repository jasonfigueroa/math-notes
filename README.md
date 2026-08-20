# Math Notes

This repository contains two independent collections of mathematics notes,
each built as its own PDF for a different audience.

## Documents

### Algebra Notes

The Algebra Notes are written to help a high-school student learn and review
algebra. They emphasize approachable explanations, worked examples, tables,
and graphs.

- Entry point: `algebra/main.tex`
- Planned output: `build/algebra.pdf`

### Discrete Structures Notes

The Discrete Structures Notes are a personal study notebook based on concepts
learned while reading Kenneth Rosen's *Discrete Mathematics and Its
Applications*. They should contain original summaries, explanations, and
worked reasoning rather than copied textbook material.

- Entry point: `discrete-structures/main.tex`
- Planned output: `build/discrete-structures.pdf`

## Repository Structure

Each subject has one standalone `main.tex` entry point and one subject index.
The subject index includes topic indexes, and each topic index includes its
individual notes or worked examples.

```text
algebra/
  main.tex
  algebra.tex
  absolute-value/
    absolute-value.tex
    example-01.tex
discrete-structures/
  main.tex
  discrete-structures.tex
shared/
  preamble.tex
figures/
  algebra/
  discrete-structures/
  shared/
```

Shared LaTeX packages and commands belong in `shared/preamble.tex`.
Subject-specific packages stay in that subject's `main.tex`.

Figures used by only one subject belong under that subject's directory in
`figures/`. Assets reused across documents belong in `figures/shared/`.

All LaTeX builds should be launched from the repository root so that input and
figure paths resolve consistently. Reproducible build commands will be added as
part of issue #1.
