class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.59"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.59/tars_0.31.59_darwin_arm64.tar.gz"
      sha256 "37266ec1cd5d77e5c3346b92de3eff8cfc56b68bbe756e8f070ce9e8ce385c4b"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.59/tars_0.31.59_darwin_amd64.tar.gz"
      sha256 "8caaa7d442d1193321a6d5c5af958140f3a15640c26d98ede2216c8ccb5b1e27"
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
