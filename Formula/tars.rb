class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.32"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.32/tars_0.32.32_darwin_arm64.tar.gz"
      sha256 "f08df927fa790a10258a16e377bb2628fe4170c6c209d1cd8915ea2a5a6bf5bf"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.32/tars_0.32.32_darwin_amd64.tar.gz"
      sha256 "98eaba133ae391f0ffe524c4fdbd5aa47b5b6804f54475aee7431fffdbfd9bd1"
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
