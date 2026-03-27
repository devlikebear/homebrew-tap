class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.13.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.13.1/tars_0.13.1_darwin_arm64.tar.gz"
      sha256 "6c28e77039b4a5a988f025d132f7ef4c9e7bb7af8a7e673dff960fcdc6287f04"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.13.1/tars_0.13.1_darwin_amd64.tar.gz"
      sha256 "a9b788a72e51ad0d754c76852a20a3c6847288d26a14b6b59283a69d8069487d"
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
