class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.70"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.70/tars_0.32.70_darwin_arm64.tar.gz"
      sha256 "c47c7cfdab3ae8cd648a7b2ccfce964fc9c8dceccb8add26d4f9d60c9e53b40e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.70/tars_0.32.70_darwin_amd64.tar.gz"
      sha256 "9525554fb6bb95fd56a4cba74677ba238016ad9f7952312f7e2dff7700d0ef16"
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
