class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.10.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.10.1/tars_0.10.1_darwin_arm64.tar.gz"
      sha256 "f2888e5f2e36fe6ac718b0c0c9d2676a72e5c51860361c7ee000eedc4c619e6c"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.10.1/tars_0.10.1_darwin_amd64.tar.gz"
      sha256 "0eb12cd3286767d38d291be3b42084145ecab1a3d5a808793372519f5748138f"
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
