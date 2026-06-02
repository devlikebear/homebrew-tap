cask "linetta" do
  version "0.2.10"
  sha256 "03ac56e78532540a81291f1764283540f6662e712f9d75623d003e159f8b1115"

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

  zap trash: "~/Library/Application Support/com.devlikebear.linetta"

  caveats <<~CAVEATS
    Linetta is ad-hoc signed and not notarized, so macOS Gatekeeper may block
    it on first launch. To allow it to run, clear the quarantine attribute:

      xattr -dr com.apple.quarantine "#{appdir}/Linetta.app"
  CAVEATS
end
