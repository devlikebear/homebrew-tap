cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.47.4"
  sha256 arm:   "d1bd8a48d61b4d8f1e76edfacb41063b26b64089ef7682233f3c3833327ed0cd",
         intel: "ddc8156744b5df79c011be7d72a70a8679279c9ec05b907591d6798e7332ea8f"

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
