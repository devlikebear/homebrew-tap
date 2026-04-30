class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.82"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.82/tars_0.31.82_darwin_arm64.tar.gz"
      sha256 "aed2ad43e77f6e645fd9d0ffe89d924d24e0a319dd9a0c35f4c963c8374429d8"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.82/tars_0.31.82_darwin_amd64.tar.gz"
      sha256 "ecb3d2c22b7a6a6c2ba4e8edf1b8c2e78e33b46ed691bc8735c376c321fe7b90"
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
