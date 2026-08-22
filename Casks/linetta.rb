cask "linetta" do
  version "0.9.6"
  sha256 "84b8046d433314f1b9a7f924f234e401addfc3b8e2597c29d42396e5c52cb640"

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
end
