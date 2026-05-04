class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.147"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.147/tars_0.31.147_darwin_arm64.tar.gz"
      sha256 "8d85b61bfbe590e11336828d6ebd9ccb0dc1d3f0c95f403de8fb9f9bb26a77b1"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.147/tars_0.31.147_darwin_amd64.tar.gz"
      sha256 "f8fb8e5f68b03f53a22a452cf3a66ce1ce0d0c7181273c43a6010d894333ae57"
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
