cask "linetta" do
  version "0.2.6"
  sha256 "07cf00df8f25886ca34109f5952a5b25810353a237b4316e8f240a766eb51381"

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
