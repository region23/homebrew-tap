cask "startmenu" do
  version "0.3.0"
  sha256 "4fe9d19ccfad1f4b6f90d4a03e7b8f7f181de5b243e0fa02e5f4c0fd4389698b"

  url "https://github.com/region23/StartMenu/releases/download/v#{version}/StartMenu-#{version}.dmg"
  name "Start Menu"
  desc "Windows-style taskbar and Start menu for macOS"
  homepage "https://github.com/region23/StartMenu"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :sonoma"

  app "StartMenu.app"

  postflight do
    # The app is ad-hoc signed (no paid Apple Developer ID, no
    # notarization). Homebrew applies the quarantine attribute to the
    # downloaded DMG like any other cask, so Gatekeeper would block the
    # first launch. Strip it so `brew install` actually leaves the user
    # with a runnable app.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/StartMenu.app"]
  end

  zap trash: [
    "~/Library/Preferences/app.pavlenko.startmenu.plist",
    "~/Library/Application Support/app.pavlenko.startmenu",
    "~/Library/Caches/app.pavlenko.startmenu",
  ]
end
