cask "startmenu" do
  version "0.3.13"
  sha256 "e3760958ae08b7ec121f5111a1bd153ec36c0559a8f30374c004bfe3a0ff8183"

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
    # Ad-hoc signed, not notarized — strip the quarantine attribute
    # Homebrew applies to every downloaded cask so Gatekeeper doesn't
    # block the first launch.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/StartMenu.app"]
  end

  zap trash: [
    "~/Library/Preferences/app.pavlenko.startmenu.plist",
    "~/Library/Application Support/app.pavlenko.startmenu",
    "~/Library/Caches/app.pavlenko.startmenu",
  ]
end
