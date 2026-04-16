cask "startmenu" do
  version "0.3.15"
  sha256 "2d8cfb424d3413832254ebbeddbbb9ff9fd0ee86811dd7f96ed8ba013c47fad9"

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
