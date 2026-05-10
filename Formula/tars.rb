class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.24"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.24/tars_0.32.24_darwin_arm64.tar.gz"
      sha256 "e409cf833d6e609a587c7e0ee93419d6c9dc95f95155dd0632fdbbb50b7a92fa"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.24/tars_0.32.24_darwin_amd64.tar.gz"
      sha256 "fa65ccd5bb819215e3441ec7e1d228876a30c4fff14890ddfa2482051b6a6c08"
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
