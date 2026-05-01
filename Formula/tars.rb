class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.125"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.125/tars_0.31.125_darwin_arm64.tar.gz"
      sha256 "5710927cf466c1f5bd42f29cd4a1c52319cb0bbddbd3a088b4454c692fc45c6b"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.125/tars_0.31.125_darwin_amd64.tar.gz"
      sha256 "c4daf422079a2c6a8f593d44088f7a6699e9bf039a9231f6aa4ab715765d9e47"
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
