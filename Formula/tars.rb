class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.42"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.42/tars_0.31.42_darwin_arm64.tar.gz"
      sha256 "01ebfa4ad5c0a95b175b60f2e0dac35229037a5f56ee0af2af2ec2c09ef86260"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.42/tars_0.31.42_darwin_amd64.tar.gz"
      sha256 "1fac0abd4ff92a286525a280d3b7932777558ce1505ef7fbfb147fa0ec3e39cf"
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
