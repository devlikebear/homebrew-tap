class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.30.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.30.2/tars_0.30.2_darwin_arm64.tar.gz"
      sha256 "1e67ff756bfee5c0e88dbfb87a818257ef495a9b731d1018e4688766bfb261ba"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.30.2/tars_0.30.2_darwin_amd64.tar.gz"
      sha256 "4724407e120ba5c445b23d069fdb0a35f882be35a396b56347d9bda0cb045da8"
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
