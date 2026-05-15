class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.65"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.65/tars_0.32.65_darwin_arm64.tar.gz"
      sha256 "7b25c392ebdd7154cf2436d2970e091bff2ff5ffb062f03d0f6534648f679fb6"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.65/tars_0.32.65_darwin_amd64.tar.gz"
      sha256 "73c8990ede41adb6a438fe145b021d97009f6b679807728bfff08058ce43f10b"
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
