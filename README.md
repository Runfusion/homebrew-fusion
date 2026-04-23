# Runfusion Homebrew Tap

Official Homebrew tap for [Fusion](https://runfusion.ai) — the multi-node AI agent orchestrator.

## Install

Easiest — one-line installer (picks Homebrew if available, falls back to npm):

```bash
curl -fsSL https://runfusion.ai/install.sh | sh
```

Or Homebrew directly:

```bash
brew tap runfusion/fusion
brew install fusion
```

Or as a single command:

```bash
brew install runfusion/fusion/fusion
```

After the initial install, upgrade and reinstall work bare:

```bash
brew upgrade fusion
brew reinstall fusion
```

## What you get

The `fusion` formula installs the [`@runfusion/fusion`](https://www.npmjs.com/package/@runfusion/fusion) CLI from npm. Both the `fn` and `fusion` commands land on your `PATH`.

```bash
fusion dashboard   # launch the Fusion dashboard + AI engine
fn dashboard       # same thing
```

Node.js is a required dependency — Homebrew installs it automatically.

## Links

- **Website:** [runfusion.ai](https://runfusion.ai)
- **Source:** [github.com/Runfusion/Fusion](https://github.com/Runfusion/Fusion)
- **npm:** [@runfusion/fusion](https://www.npmjs.com/package/@runfusion/fusion)

## License

MIT — Fusion and this tap are both MIT licensed.
