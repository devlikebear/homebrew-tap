class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.45"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.45/tars_0.32.45_darwin_arm64.tar.gz"
      sha256 "834dd7d94ead154091628b344d6c40b768a74828085d8e738fa26978093c1f5a"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.45/tars_0.32.45_darwin_amd64.tar.gz"
      sha256 "69ae01aa6379acaffc771f75f1ce2a9da189d70dbad60dcd3b4ef0e9616eb7f9"
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
