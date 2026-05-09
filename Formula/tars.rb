class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.18/tars_0.32.18_darwin_arm64.tar.gz"
      sha256 "190689b3dcaf2e5072e49bd1c400ff37ffbf2ef99e146155e19b747b8f4368f6"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.18/tars_0.32.18_darwin_amd64.tar.gz"
      sha256 "043e744acbf63e0dd1a6e83e3e09cc0127dad3427b7d527390e3f130eebe9fbd"
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
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tars --version")
  end
end
