class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.8/tars_0.31.8_darwin_arm64.tar.gz"
      sha256 "f71b7edabe2f672cb386aeb6592d25d86d72af55acfac1a81b3595424fbeb2b4"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.8/tars_0.31.8_darwin_amd64.tar.gz"
      sha256 "d51c66243da000acb9c7ee2683241f5ded648ebacb4b4d931b8168d05c242484"
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
