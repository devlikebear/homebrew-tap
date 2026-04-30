class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.55"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.55/tars_0.31.55_darwin_arm64.tar.gz"
      sha256 "aabd1a262a0eef68fe5ee7ba66f12e99436caa002d4b12f65290f4a46e6a17f1"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.55/tars_0.31.55_darwin_amd64.tar.gz"
      sha256 "1fe845fc2c6e968175bd81fafb8761a755da41e22d4880b4d0c48f36d41d1bb8"
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
