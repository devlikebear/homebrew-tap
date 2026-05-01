class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.93"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.93/tars_0.31.93_darwin_arm64.tar.gz"
      sha256 "b4d3109219f348f8ac84adfceb332e0f0d14543408214068ab591bf8cf43dc8f"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.93/tars_0.31.93_darwin_amd64.tar.gz"
      sha256 "d3209c360dc27be78589de849537960c819da4eebf7c2b43cb4b2f7e13b17338"
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
