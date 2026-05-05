class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.177"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.177/tars_0.31.177_darwin_arm64.tar.gz"
      sha256 "abd87207f721c5ae202da1b898874cf012d3098072dd85aad0c79d8c4b7ba156"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.177/tars_0.31.177_darwin_amd64.tar.gz"
      sha256 "ea8b4a5ffbafd2acfca67b8427b74a67a29a5e3b543fe1a1fbe3c40fbc345602"
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
