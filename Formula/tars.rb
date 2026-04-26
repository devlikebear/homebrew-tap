class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.6/tars_0.31.6_darwin_arm64.tar.gz"
      sha256 "e98edc8c7f9739a0f24d4310c1a122248416cff54fa27b72d6af260a9186d1cc"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.6/tars_0.31.6_darwin_amd64.tar.gz"
      sha256 "b4fe83079bd9b47deacb67c785d08b1b48a251e8a0f624465338fe05e72e1d6f"
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
