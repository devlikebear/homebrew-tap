class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.115"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.115/tars_0.31.115_darwin_arm64.tar.gz"
      sha256 "0196ae181b2422c86b1be07066de77da0da0076c4b60d78bc9506ad40b318089"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.115/tars_0.31.115_darwin_amd64.tar.gz"
      sha256 "c763385439dccdfdb4c445e64ab526ad867b59d16ab7c585e9047a668954bd15"
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
