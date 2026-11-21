# Changelog

All notable changes to this project are documented here. Every release has its own
section, headed by the version named in the release commit (for example
`Release: 0.4.1`), because the release workflow uses the section that matches the
version as the release notes.

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
