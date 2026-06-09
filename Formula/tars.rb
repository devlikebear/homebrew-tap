class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.34.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.34.2/tars_0.34.2_darwin_arm64.tar.gz"
      sha256 "74739aabea06cd7c50b01c50090126d43859e34eabf2b2bcf154337da6f93ced"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.34.2/tars_0.34.2_darwin_amd64.tar.gz"
      sha256 "7c30b3454e4d91fcb0ad49265ecadacee336a0a2aa67e1f91ff8a7290858885b"
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
