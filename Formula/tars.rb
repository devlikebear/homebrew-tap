class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.5/tars_0.31.5_darwin_arm64.tar.gz"
      sha256 "5cccffbfa4f6609d486c2c3663ee56a5801c0438246f95f83958e20ed519daa2"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.5/tars_0.31.5_darwin_amd64.tar.gz"
      sha256 "1f03f7d3673ac5526224f04848f73447f7e00d7243d7e14ca4ef63d3fbfafcfc"
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
