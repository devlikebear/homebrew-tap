class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.113"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.113/tars_0.31.113_darwin_arm64.tar.gz"
      sha256 "75406cb9734b77fd5d5f36a7ad52992329945e3e2d6c6edc541d68162ef58124"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.113/tars_0.31.113_darwin_amd64.tar.gz"
      sha256 "84620f887cde35588dffd39e00d03cf0b5198f9627da4ebee7a86bca97d43526"
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
