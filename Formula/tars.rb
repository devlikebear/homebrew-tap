class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.69.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.69.0/tars_0.69.0_darwin_arm64.tar.gz"
      sha256 "c744e023c3323321c7247c7a763d77d08c76cd77f4318971f29119c20580dc23"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.69.0/tars_0.69.0_darwin_amd64.tar.gz"
      sha256 "7a8430cddfc3f5e3a208d4b854d244d47d74fac0a484cb1aac227e801c845a89"
    end
  end

  def install
    bin.install "tars"
    prefix.install "share" if Dir.exist?("share")
  end

  def caveats
    <<~EOS
      Optional assistant dependencies are not installed by this formula.
      Install them separately when needed:
        brew install ffmpeg whisper-cpp

      This formula is the command-line install. The desktop app (tray,
      approval notifications, its own window) ships its own tars, so with
      it you do not need this formula:
        brew install --cask devlikebear/tap/tars-desktop
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tars --version")
  end
end
