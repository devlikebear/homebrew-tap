class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.59"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.59/tars_0.32.59_darwin_arm64.tar.gz"
      sha256 "e32d301f5c3fc1a2742c64ae21e1f8ae3f4a0f97206e1c4b56939b868bafe785"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.59/tars_0.32.59_darwin_amd64.tar.gz"
      sha256 "e4ef0088ff1e02aeb69edb8ed64189986ddd33d2bdfe8622787929ad8824b727"
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
