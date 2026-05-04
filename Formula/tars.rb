class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.141"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.141/tars_0.31.141_darwin_arm64.tar.gz"
      sha256 "4351e4186c76d1547b20cadfca8701e2c3d3f2191ec42de0252f6efd5ca0b744"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.141/tars_0.31.141_darwin_amd64.tar.gz"
      sha256 "cb0777c6583e4e26da1e6c9031e29c8a827c4602bce863a2445e0d9d633a8cf6"
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
