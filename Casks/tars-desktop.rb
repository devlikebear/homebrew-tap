cask "tars-desktop" do
  arch arm: "arm64", intel: "amd64"

  version "0.60.0"
  sha256 arm:   "a0f94cada87cbdbb939c39afca7f1345a60da5109b68478b306c5a3628048d65",
         intel: "228e73c299a7b3398ddb965057cbc316adff7873e83f0fba954ed4e6f851c509"

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
