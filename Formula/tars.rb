class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.11/tars_0.31.11_darwin_arm64.tar.gz"
      sha256 "e5271ad913605d2188cebb1962d7ad8e715c6588f432e94ae0b712e0b42ba650"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.11/tars_0.31.11_darwin_amd64.tar.gz"
      sha256 "23947d87dc64c29a093ea44b2efac46c633239b7fd9029950bff709f14e3b873"
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
