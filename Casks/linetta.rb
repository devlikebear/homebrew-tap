cask "linetta" do
  version "0.4.12"
  sha256 "7a370ed354a9503d2da386f0ce82d86c9029968e1391ad343b49c6279ba5a1f8"

  url "https://github.com/devlikebear/linetta/releases/download/v#{version}/Linetta-macos.app.tar.gz"
  name "Linetta"
  desc "Local-first desktop writing app for long-form fiction"
  homepage "https://github.com/devlikebear/linetta"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The macOS build is published for Apple Silicon only.
  depends_on arch: :arm64

  app "Linetta.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Linetta.app"],
                   sudo: false
  end

  zap trash: "~/Library/Application Support/com.devlikebear.linetta"

  caveats <<~CAVEATS
    Linetta is not notarized yet. This cask clears the quarantine
    attribute after install so macOS can launch the app.
  CAVEATS
end
