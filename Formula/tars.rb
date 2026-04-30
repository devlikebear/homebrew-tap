class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.64"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.64/tars_0.31.64_darwin_arm64.tar.gz"
      sha256 "46403675e69b16df6b02b10805992c28c221cecfee99b59fe85791265531d9c4"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.64/tars_0.31.64_darwin_amd64.tar.gz"
      sha256 "4e8302a938a39e4e5ea8b98afb9694ae43f6f1122f18a9623ac3bff42b1940f1"
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
