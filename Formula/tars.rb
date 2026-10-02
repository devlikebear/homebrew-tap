class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.43.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.43.2/tars_0.43.2_darwin_arm64.tar.gz"
      sha256 "403b48ab4ea8061aa5c7207b2a9b48403724f1508cc163159d58b68087906068"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.43.2/tars_0.43.2_darwin_amd64.tar.gz"
      sha256 "c734079b9ddcb1b8c91638e8b94272ed5393deb85aca8edab9aa77d23cc2c35c"
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

      For the desktop app (tray, approval notifications, its own window):
        brew install --cask devlikebear/tap/tars-desktop
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tars --version")
  end
end
