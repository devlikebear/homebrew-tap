class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.71"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.71/tars_0.32.71_darwin_arm64.tar.gz"
      sha256 "9dfe2971d40478f216dbd9977d7022a0230f98d0e6649c3161374df252efdcea"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.71/tars_0.32.71_darwin_amd64.tar.gz"
      sha256 "9d81782609f0c20b662218f608ddeea7d362a498bcc2f7998be25949b5a3fc20"
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
