class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.10.0/tars_0.10.0_darwin_arm64.tar.gz"
      sha256 "3e9f9b2c34e8e647697daada91e3ed5756b04807114fcb7962366123f7ac316c"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.10.0/tars_0.10.0_darwin_amd64.tar.gz"
      sha256 "0303d343325da5018fbe8bed6498923fea79612212688aa002b7267d40e42a9a"
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
