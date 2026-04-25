class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.28.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.28.2/tars_0.28.2_darwin_arm64.tar.gz"
      sha256 "403b43e9352de57aa63c3bbba9c9af88df03bc773f4a5c76c5f83b19ce1a76fa"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.28.2/tars_0.28.2_darwin_amd64.tar.gz"
      sha256 "24b2de193d025a95ff55281ab54bdcae50a7bc05834314dd0cac4018a0a2588f"
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
