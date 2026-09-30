class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.40.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.40.0/tars_0.40.0_darwin_arm64.tar.gz"
      sha256 "f54d97c493b8b0ced6d3e61e2f3c1d0665df4294a2373bfa277f44f14e3039b3"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.40.0/tars_0.40.0_darwin_amd64.tar.gz"
      sha256 "3e543423ff44bca648276765c763432f51cd37e727d30a3855ea914e76a25a40"
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
