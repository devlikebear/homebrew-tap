class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.42.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.42.0/tars_0.42.0_darwin_arm64.tar.gz"
      sha256 "65ddb1384852d8ffda440c00621663fe2a1b0d1ee39dbc0d7b58f773db40a676"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.42.0/tars_0.42.0_darwin_amd64.tar.gz"
      sha256 "f6d3efa63a29d730076001193939f3a3b05b15e215bdcee3d32a5d8a693b02df"
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
