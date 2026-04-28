class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.22/tars_0.31.22_darwin_arm64.tar.gz"
      sha256 "0428d83f34eaa8689ae38fdffdac3713e1b87b91e280f52e357f02bf85f7bdaf"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.22/tars_0.31.22_darwin_amd64.tar.gz"
      sha256 "4a592eb09afedbb7421cdb9a18abe919d90c42b3a98cff100379ff6248851499"
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
