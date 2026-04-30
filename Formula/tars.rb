class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.46"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.46/tars_0.31.46_darwin_arm64.tar.gz"
      sha256 "613250739f58020245475705a25a142a51357fbcbb36c4598bcd166997e2a66a"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.46/tars_0.31.46_darwin_amd64.tar.gz"
      sha256 "a4c52651997cf5ab7b0fae28222771d4bfac26dcd448adf0145fa85c7e5f55b4"
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
