# Changelog

## v0.4.2

### Changed

- The prepared installation no longer stores absolute paths. The Windows launcher serves
  `app0/Media` and `app0/sce_sys` as path aliases built from the folder it runs from instead of
  creating directory junctions, so the installation can be moved, copied or unpacked anywhere.
  An installation prepared by an earlier launcher has those two junctions removed on the next
  start; only reparse points are deleted, never real folders.
- The Linux preparation tool links the game's resource folders with relative symlinks instead of
  absolute ones, so the prepared tree survives a move together with the dump.
- Releases are built and published by the `Release` workflow when a commit message reads
  `Release: X.Y.Z`.

### Fixed

- The Windows build links again: `libkernel` now provides the two-argument
  `RunExceptionHandlerInline` that `Umtx.cpp` calls, as the Linux build already did.
- The release workflow builds with the project's documented GCC 15.2 instead of the MSYS2
  rolling compiler, and reports a failed build's error in a public check annotation.

## About this changelog

All notable changes to this project are documented here. The newest release comes first: every
release has its own section, headed by the version named in the release commit (for example
`Release: 0.4.1`), and the release workflow publishes only the section that matches the version,
from its heading up to the next one. This note therefore sits after the oldest section, where it
is never part of any release's notes.
