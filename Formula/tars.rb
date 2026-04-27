class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.15/tars_0.31.15_darwin_arm64.tar.gz"
      sha256 "7d60c9440d12ef163e364acd20bfa75650aa909ab05042fd261c41c210c3810a"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.15/tars_0.31.15_darwin_amd64.tar.gz"
      sha256 "a53068bb4d309eb6c76e27887719d31d6501d0aab719e0d3e66b5653567ad483"
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
