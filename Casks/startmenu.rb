cask "startmenu" do
  version "0.3.11"
  sha256 "3a261be8e3dce7ebb4120ebe4da568b19373d3ea344b21298e29b44934497142"

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
