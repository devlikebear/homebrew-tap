cask "linetta" do
  version "0.4.19"
  sha256 "df453658933273fc39150d021154f1b9551f27c9f808547c66607fcc3f9f452b"

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
