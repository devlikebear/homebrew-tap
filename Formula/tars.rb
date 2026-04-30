class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.83"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.83/tars_0.31.83_darwin_arm64.tar.gz"
      sha256 "843f5437bfe7221cdb36c9ca617c9335abf7689d12f89c821996bd1f49c1e96a"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.83/tars_0.31.83_darwin_amd64.tar.gz"
      sha256 "2c3d30927e309dc5606525048de0bf5ec3ff26e5afc16f0887fdafc807e1ad2f"
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
