class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.40.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.40.4/tars_0.40.4_darwin_arm64.tar.gz"
      sha256 "2c797cae8f1cd3097bfdee10e22823749a7fcdbc7ecc3a235449caea645d6e3e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.40.4/tars_0.40.4_darwin_amd64.tar.gz"
      sha256 "ba27c965e32d1a7d4e1d880f0594a4b96b8890de18ccedbb3f772fd9fbc015eb"
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
