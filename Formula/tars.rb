class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.49"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.49/tars_0.31.49_darwin_arm64.tar.gz"
      sha256 "e7bc7dcc4f784015fc5ceaf34f89c9846ac8e565c13f517bcfcbb9a2a3cb6d07"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.49/tars_0.31.49_darwin_amd64.tar.gz"
      sha256 "542b5b7b24fe2c1af186c0ff4898586627a48490da544b50bde29e520adab184"
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
