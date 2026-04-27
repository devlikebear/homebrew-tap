class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.18"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.18/tars_0.31.18_darwin_arm64.tar.gz"
      sha256 "e5ebc301eb37a788bb6fa0bdf650789d47abf267f4d5ad120faaf841627389a1"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.18/tars_0.31.18_darwin_amd64.tar.gz"
      sha256 "885f58ddebbfbcc77d601bd17313b036e976340d7c5653acc5bd1f1cc0ef167e"
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
