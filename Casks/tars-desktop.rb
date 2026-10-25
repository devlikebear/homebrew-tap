cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.66.0"
  sha256 arm:   "71afc965a6649dd772025346e26554b4b473caf9971f3cdadbc7a51e62cff15e",
         intel: "6d1a648c674fe34fe2f1d7586c8a8f4d98a9bfb3c4d1c210bdb750352c21fd4c"

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
