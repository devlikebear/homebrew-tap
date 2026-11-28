cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.71.4"
  sha256 arm:   "edb56fdca7e1e57d53cafc9333aa006ac6d7302ad5c705eb9ad29275c3d48ea9",
         intel: "68455b2d2208475ec87c67e2088c5577d005283570b68cbf421dcf794c30a06e"

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
