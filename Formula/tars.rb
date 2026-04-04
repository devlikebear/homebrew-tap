class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.18.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.18.0/tars_0.18.0_darwin_arm64.tar.gz"
      sha256 "3af07c9898e8837bfdbe6d0b8d93e1b6ffcfe6706e44a20da1367111988a6757"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.18.0/tars_0.18.0_darwin_amd64.tar.gz"
      sha256 "8b2f3e5297ee41b16698a0d72e1da544a6cde5e43671d16f914d3a3ab2db0986"
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
