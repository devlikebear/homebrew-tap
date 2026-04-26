class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.2/tars_0.31.2_darwin_arm64.tar.gz"
      sha256 "886f4c1cf64827e5b702fc814ad395c5321c929a7320c582081827f7233c13f9"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.2/tars_0.31.2_darwin_amd64.tar.gz"
      sha256 "423aed2cbde910a7c352d0e162c9b461efda08d766f6861a34db1318555c3b0f"
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
