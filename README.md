# Homebrew tap for BrewStore

Official [Homebrew Cask](https://github.com/Homebrew/homebrew-cask) does not accept unsigned apps. BrewStore ships unsigned, so this tap is the Homebrew install path.

**App:** [brewstore.app](https://brewstore.app/) · **Source:** [BrewStore-by-Manish-Vagh](https://github.com/manishvagh/BrewStore-by-Manish-Vagh)

## Install (Apple Silicon)

```bash
brew install --cask manishvagh/brewstore/brewstore
```

That command taps this repo and trusts only the BrewStore cask (Homebrew 6 tap trust).

Or:

```bash
brew tap manishvagh/brewstore
brew trust --cask manishvagh/brewstore/brewstore
brew install --cask brewstore
```

Upgrade later with:

```bash
brew update && brew upgrade --cask brewstore
```

BrewStore can also update itself from **Updates** in the app.

## Uninstall

```bash
brew uninstall --cask brewstore
```

Remove leftover files:

```bash
brew uninstall --cask --zap brewstore
```

## Why not `brew install --cask brewstore` from core?

Homebrew is dropping official casks that fail Gatekeeper (unsigned / unnotarized). BrewStore is MIT and open source, but the DMG is not Apple-signed. This tap is the supported Homebrew distribution until a signed build exists.

## Maintainers

Bump `Casks/brewstore.rb` `version` and `sha256` when a GitHub release is published:

```bash
shasum -a 256 BrewStore-VERSION-arm64.dmg
```
