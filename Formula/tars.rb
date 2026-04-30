class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.40"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.40/tars_0.31.40_darwin_arm64.tar.gz"
      sha256 "a962e484bbe6ba68dcdc0f34d27d61269a7d386549fdb1f9c47b4d556463435f"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.40/tars_0.31.40_darwin_amd64.tar.gz"
      sha256 "10cabae93fd389b0e0411720fb5d9b762127851d20abe9a90a97723829c5a9f0"
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
