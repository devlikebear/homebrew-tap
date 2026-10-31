cask "linetta" do
  version "1.16.1"
  sha256 "00e5fef2c8f62b1896b66fe5c028f01e65173068fbef36d2232db234f21f67a0"

  url "https://github.com/devlikebear/linetta/releases/download/v#{version}/Linetta-macos.app.tar.gz"
  name "Linetta"
  desc "Local-first desktop writing app for long-form fiction"
  homepage "https://github.com/devlikebear/linetta"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself from GitHub releases.
  auto_updates true

  # The macOS build is published for Apple Silicon only.
  depends_on arch: :arm64

  app "Linetta.app"

  zap trash: "~/Library/Application Support/com.devlikebear.linetta"
end
