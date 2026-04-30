class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.80"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.80/tars_0.31.80_darwin_arm64.tar.gz"
      sha256 "65fbbabf5af9c65669f9b53c461eb98b6e8bb1ca5101a5b8ded077889567d642"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.80/tars_0.31.80_darwin_amd64.tar.gz"
      sha256 "8bfc1b43b64659dc170ed48da0b4e54350a9229ddc3f7ff6b5b7839559a3d9a6"
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
