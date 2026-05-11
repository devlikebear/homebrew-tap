class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.34"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.34/tars_0.32.34_darwin_arm64.tar.gz"
      sha256 "7ce12577b075c2b56fdb43dc10245489df195a2abf1890875efa0c6d0fc0db71"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.34/tars_0.32.34_darwin_amd64.tar.gz"
      sha256 "9e00a5c12b229e3e8eac94f45edbdd49b4f99924f5b5a5d853dbf5c9e1641226"
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
