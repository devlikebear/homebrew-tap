cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.44.0"
  sha256 arm:   "5661e2c0caff0d8a69c1570e51b0ca4f8a4a15675cd3a9c575c86822acf15081",
         intel: "0ba45adafd19d50805178d8c6673a64a4927dc8a1c084e4b18ced289b5583e60"

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
  depends_on formula: "devlikebear/tap/tars"
  depends_on :macos

  app "TARS.app"

  zap trash: [
    "~/Library/Application Support/tars-desktop",
    "~/Library/Caches/com.devlikebear.tars.desktop",
    "~/Library/WebKit/com.devlikebear.tars.desktop",
  ]
end
