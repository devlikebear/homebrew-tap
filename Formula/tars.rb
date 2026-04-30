class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.54"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.54/tars_0.31.54_darwin_arm64.tar.gz"
      sha256 "99717ab7c3fcf0c7babc41a0e0031918aa1a5ede03b37fa815ec06c3c1364c5e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.54/tars_0.31.54_darwin_amd64.tar.gz"
      sha256 "985ac34d0d01bcf140a29e11591a19c8403d4f269c1fa0b634eefd7729666089"
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
