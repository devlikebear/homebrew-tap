class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.25/tars_0.32.25_darwin_arm64.tar.gz"
      sha256 "2cfdf76f567e18f71a58a27979d76dfcce6bd9e65158ca0ee108d057116cea51"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.25/tars_0.32.25_darwin_amd64.tar.gz"
      sha256 "07a8517a871371a17405ccfa3443bf61af22fe17f619769256b0ee27a7eb7aaa"
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
