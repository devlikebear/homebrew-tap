class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.11.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.11.0/tars_0.11.0_darwin_arm64.tar.gz"
      sha256 "0f032afcab77018c6d6a5dc51993f4f0029ddbd960730a13b4c70a8648dd57db"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.11.0/tars_0.11.0_darwin_amd64.tar.gz"
      sha256 "453b2d36ae6ab18078ecc4627b94ecb4b8609384aac4ffa58ef7fc188ba47b41"
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
