class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.109"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.109/tars_0.31.109_darwin_arm64.tar.gz"
      sha256 "92acfa24c0035845e0e342d922d77e977fa191ecdb9eeba933de06e671d1cfaf"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.109/tars_0.31.109_darwin_amd64.tar.gz"
      sha256 "a1d8db5f79d1c63193f6f4088b16b9c4424fa9d0bcb05e6ea82a922cc83f8aaf"
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
