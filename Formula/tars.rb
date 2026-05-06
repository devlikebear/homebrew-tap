class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.1/tars_0.32.1_darwin_arm64.tar.gz"
      sha256 "47b6df7cd4935edaa9840281df71135099adfa145805bb14c54168f639760f2c"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.1/tars_0.32.1_darwin_amd64.tar.gz"
      sha256 "f6a4cd4f5ae9af3cb15fd638a6218b01053f6bc482dcdbcaca9620c5a016455d"
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
