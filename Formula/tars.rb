class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.98"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.98/tars_0.31.98_darwin_arm64.tar.gz"
      sha256 "bb45f32a366af9ded19424047b56e55e362b6cf91b86add70616d7272fc4268c"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.98/tars_0.31.98_darwin_amd64.tar.gz"
      sha256 "4849799f62693e698b4d8395dbfc0ba689b5a2fcd822de7625268302cf184513"
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
