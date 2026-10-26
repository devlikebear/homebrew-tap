cask "linetta" do
  version "1.12.1"
  sha256 "f65770a4bffcf70758c631305b50beb53f46aa5c1a9293c47b74570fbab8dd62"

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
