class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.14/tars_0.31.14_darwin_arm64.tar.gz"
      sha256 "09c78a64d86b920048f9b7aeff8cbd0fb03440d2e2aba186ec3064335f6148ba"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.14/tars_0.31.14_darwin_amd64.tar.gz"
      sha256 "275e42f1aac1acff734c0d73af7cd1cb08c0549eb3d823dd97f2bcd42e8ba431"
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
