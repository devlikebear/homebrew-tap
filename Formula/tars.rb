class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.119"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.119/tars_0.31.119_darwin_arm64.tar.gz"
      sha256 "25f85501929e83529e2afc1f061314f66c1c524e4bad5fc508255cdba3ed1b0f"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.119/tars_0.31.119_darwin_amd64.tar.gz"
      sha256 "d71c8813443844dfc207590011b702b22b4089bd22b7a43207a7e7abd560280f"
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
