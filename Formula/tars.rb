class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.28"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.28/tars_0.32.28_darwin_arm64.tar.gz"
      sha256 "aa1862f26191b282d4c7698586f024f7e3b645dca58bf49ba8b5f9376d15a1ac"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.28/tars_0.32.28_darwin_amd64.tar.gz"
      sha256 "6a07ee5cd2bc78464d72fb5b25862c4a51b4af07021f7344ca6375b571d7e70d"
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
