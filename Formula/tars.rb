class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.22"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.22/tars_0.32.22_darwin_arm64.tar.gz"
      sha256 "4c251e8952d3f83efec8ea83e00bda4b28eb3a0b0fb02a30bf3903f2e3be6ecc"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.22/tars_0.32.22_darwin_amd64.tar.gz"
      sha256 "e101e1792b32226cd741eb8427f523df15897c5c35bd8739b76602770871cbf5"
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
