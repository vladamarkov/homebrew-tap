# vladamarkov/homebrew-tap

Homebrew casks maintained by the author of [Kvotar](https://github.com/vladamarkov/kvotar).

## Kvotar

    brew install --cask vladamarkov/tap/kvotar

This installs the same signed, notarized build as [kvotar.com/download](https://kvotar.com/download),
made from tag `v0.3.0-beta.10` of the Kvotar repository.

Kvotar updates itself: it checks daily and installs an update only when you click **Install**.
`brew upgrade` replaces it only when your copy is older than this tap's. `brew upgrade --cask
kvotar` and `--greedy` install this tap's build whenever it differs from the one Homebrew
installed, even if Kvotar has already updated itself past it. When Homebrew replaces it, it quits
Kvotar first and reopens it afterwards.

To remove the app: `brew uninstall --cask kvotar`. To remove it and its data (database, logs,
preferences, caches): `brew uninstall --zap --cask kvotar`. Neither touches Claude Code's or
Codex's own files or sign-ins.

Report problems at [vladamarkov/kvotar](https://github.com/vladamarkov/kvotar/issues).
