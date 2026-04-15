# region23's Homebrew tap

Personal [Homebrew](https://brew.sh) tap for macOS apps by [@region23](https://github.com/region23).

## Usage

```bash
brew tap region23/tap
```

After tapping, the casks below become available as if they were part of the main Homebrew catalogue.

## Available casks

### Start Menu

Windows-style taskbar and Start menu for macOS. Source: [region23/StartMenu](https://github.com/region23/StartMenu).

```bash
brew install --cask startmenu
brew upgrade --cask startmenu    # when a new release ships
brew uninstall --cask startmenu
```

Brew copies the app into `/Applications` with the correct quarantine handling, so you can launch it on the first try without the "macOS cannot verify that this app is free from malware" dialog.

## Why a personal tap?

The main `homebrew/cask` catalogue accepts only notarized applications or projects with a well-established release history. Apps distributed without a paid Apple Developer ID (like Start Menu) end up in personal taps instead, which is the standard Homebrew pattern.
