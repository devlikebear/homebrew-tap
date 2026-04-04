class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.16.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.16.1/tars_0.16.1_darwin_arm64.tar.gz"
      sha256 "c00e4fcea35f60694fa2a8443c8d346727e66affbd3f4b31b865aa6b35a091ff"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.16.1/tars_0.16.1_darwin_amd64.tar.gz"
      sha256 "71d95ae2216b8c7ff6b5615a1dfabf145f6ebe227a4a63e1f1bb6acf59b891f0"
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
