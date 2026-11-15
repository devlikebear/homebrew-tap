cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.69.0"
  sha256 arm:   "45b4301d76cd88319377432f0960df9fd227c47b170bab4fe187c33d1b21b9b9",
         intel: "904de9cd1aa3a15a2812ef5db15ccd6235ee7ae1441e8e393823a7d1fd34a7f9"

  url "https://github.com/devlikebear/tars/releases/download/v#{version}/tars-desktop_#{version}_darwin_#{arch}.tar.gz"
  name "TARS"
  desc "Desktop app for the local TARS server"
  homepage "https://github.com/devlikebear/tars"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app replaces itself from GitHub releases (tray: Check for updates).
  auto_updates true
  depends_on :macos

  app "TARS.app"

  # TARS.app ships the tars server and command-line tool. The formula
  # devlikebear/tap/tars installs the same command without the app; when it
  # is installed it keeps bin/tars, and linking over it would fail.
  binary "#{appdir}/TARS.app/Contents/Helpers/tars" unless (HOMEBREW_PREFIX/"opt/tars").exist?

  zap launchctl: "io.tars.server",
      trash:     [
        "~/Library/Application Support/tars-desktop",
        "~/Library/Caches/com.devlikebear.tars.desktop",
        "~/Library/LaunchAgents/io.tars.server.plist",
        "~/Library/WebKit/com.devlikebear.tars.desktop",
      ]

  caveats <<~EOS
    TARS.app includes the tars server and the tars command; nothing else
    needs installing.

    If the formula devlikebear/tap/tars is installed, it keeps the tars
    command on PATH (the app still runs its own server). To use the app's:
      brew uninstall devlikebear/tap/tars
      brew reinstall --cask devlikebear/tap/tars-desktop
  EOS
end
