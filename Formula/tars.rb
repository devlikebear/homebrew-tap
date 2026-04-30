class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.57"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.57/tars_0.31.57_darwin_arm64.tar.gz"
      sha256 "0c978e06b31519e4ab20a41864f6b11a9753670ff4147a8925572b98af66c42d"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.57/tars_0.31.57_darwin_amd64.tar.gz"
      sha256 "8d8a55895b10b5a44bf780962b6d3d8876e3ec7446d7b0c5ff9f024da5ea1e9e"
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
