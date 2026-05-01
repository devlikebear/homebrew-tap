class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.123"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.123/tars_0.31.123_darwin_arm64.tar.gz"
      sha256 "1949d6842373cbb0bd3da1acb37ce0e15318e6617eab6350f26030d56cc121e4"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.123/tars_0.31.123_darwin_amd64.tar.gz"
      sha256 "42ab2fd068c79d78c5c9b7bb78eff2baeeb19be57c4ae45023165bb289ff0df1"
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
