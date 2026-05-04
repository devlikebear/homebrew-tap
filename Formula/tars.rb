class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.139"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.139/tars_0.31.139_darwin_arm64.tar.gz"
      sha256 "2462f86a90684de27023728afc4d290e8326fd9f3234fa7ff6f1efaca9a4bf8e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.139/tars_0.31.139_darwin_amd64.tar.gz"
      sha256 "86c12dd71cf40d7277feb4354a56e055c9a165f0064af2bcce43ce6c03cc507c"
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
