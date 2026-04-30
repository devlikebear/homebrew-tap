class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.58"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.58/tars_0.31.58_darwin_arm64.tar.gz"
      sha256 "e66a04c083018e9090ee0e3e59473228a27a6e6ff58eda1f28133cb54973e7f9"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.58/tars_0.31.58_darwin_amd64.tar.gz"
      sha256 "445f24943a2f0007ce28ac42119826f303c6aee0d2fb133fd0a45f45cba7a610"
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
