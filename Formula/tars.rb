class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.39.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.39.0/tars_0.39.0_darwin_arm64.tar.gz"
      sha256 "cbc0b5c4ed8caa04bf79c5216b0ad6c70e55d861482853b59e6299542d2d7c3e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.39.0/tars_0.39.0_darwin_amd64.tar.gz"
      sha256 "350c706a81de9b1cf70f7c1a9c63eedbc4d3acb0f44e1c83df3d4f582df7dade"
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
