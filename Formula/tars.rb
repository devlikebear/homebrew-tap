class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.94"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.94/tars_0.31.94_darwin_arm64.tar.gz"
      sha256 "9b4be80281ae913c07de1584d40580e50aee53e64251c290046ca7ed58f37471"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.94/tars_0.31.94_darwin_amd64.tar.gz"
      sha256 "1ceb65ca6f527a21886f93f7125ab8887bfcc3051002b71883fe36a537139e2b"
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
