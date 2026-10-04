cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.45.6"
  sha256 arm:   "8677f1697783218fb7df4f1922e4a240dd22a7c2298d795fd52295c8e3a94f44",
         intel: "84cc396d04be4bb7ebb25452cf601d8d28833f73919f650f6fd0fb229aa3fea3"

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
