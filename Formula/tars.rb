class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.28"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.28/tars_0.31.28_darwin_arm64.tar.gz"
      sha256 "5b274078a740beeab3e333d4d217e1f35a785c5b08236d4420475396b5d9e27f"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.28/tars_0.31.28_darwin_amd64.tar.gz"
      sha256 "0c4023fa1e3c4376911d87b48819547b96c94700f388640258a359f066c09902"
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
