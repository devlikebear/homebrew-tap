class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.52"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.52/tars_0.31.52_darwin_arm64.tar.gz"
      sha256 "1dc3d9b55888bb4d4bcf097f83191f37b23e0acd552eb430aab9573688891562"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.52/tars_0.31.52_darwin_amd64.tar.gz"
      sha256 "2766848b89104260f744e48dc1b16b5e19f910907416cefee2305b61d7e9c82b"
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
