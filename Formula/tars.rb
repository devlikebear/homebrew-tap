class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.30.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.30.1/tars_0.30.1_darwin_arm64.tar.gz"
      sha256 "98478f5eb1a2e789c96889c0515151ec233df469fec10c2d2b4abe3efc407d5d"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.30.1/tars_0.30.1_darwin_amd64.tar.gz"
      sha256 "7b367002b2109dc5344a327f2555b2e8a650df29e3d5759fc0a7e58072405ff4"
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
