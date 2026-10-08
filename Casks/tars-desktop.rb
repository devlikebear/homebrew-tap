cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.54.0"
  sha256 arm:   "7b2eae11081d82b5c88826a3079d47f23ec8559793598ac57d795defa0b2c1cd",
         intel: "24601b927d01331cb9730baeb4560c183ee1034c8c95031282c801a80e23ee14"

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
