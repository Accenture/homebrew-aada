# Homebrew Tap for AADA

This repository is a Homebrew tap for installing AADA (Accenture Automated Dependency Analyzer). The upstream project is hosted at:

- AADA on GitHub: https://github.com/Accenture/aada

## Install

You can install AADA via Homebrew using this tap:

```bash
brew tap Accenture/aada
brew install aada
```

If you already have the tap added, you can update and upgrade:

```bash
brew update
brew upgrade aada
```

## Usage

After installation, run:

```bash
aada --help
```

Refer to the upstream repository for full documentation, usage examples, and issues:
https://github.com/Accenture/aada

## Troubleshooting

- Ensure you have the latest Homebrew: `brew update`
- If installation fails, try: `brew uninstall aada && brew cleanup && brew install aada`
- Check the formula in `Formula/aada.rb` in this tap for version details.

## License

AADA is licensed as per its upstream repository. See the license information at:
https://github.com/Accenture/aada
