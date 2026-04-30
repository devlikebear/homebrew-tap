class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.72"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.72/tars_0.31.72_darwin_arm64.tar.gz"
      sha256 "4bbc7e00a2e3a7c7d6dd6e0eaa2eba03241f7f277f09c18b93f9b6172d5d8148"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.72/tars_0.31.72_darwin_amd64.tar.gz"
      sha256 "dbcd65378d2399327bc0c8863e11b192a79bcb4c248c629fb5d374c558462da8"
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
