# homebrew-tap

Homebrew tap for cyakimov tools.

| Tool | Install |
| --- | --- |
| [Metron](https://github.com/cyakimov/metron) - Claude and Codex account limits | `brew install cyakimov/tap/metron` |
| [Treepi](https://github.com/cyakimov/treepi) - Git worktrees | `brew install cyakimov/tap/treepi` |

The native Metron app will use the separate cask `cyakimov/tap/metron-app` after its first app release.
The Metron repository's macOS app release workflow opens a `cask-metron-app-<version>` pull request containing the real release DMG checksum.
Merge that pull request after the Casks checks pass.
Cask pull requests do not use the formula bottle-publishing workflow.

```sh
brew install --cask cyakimov/tap/metron-app
```

The initial app builds are ad-hoc signed and not notarized.
macOS may require first-launch approval in System Settings > Privacy & Security.
