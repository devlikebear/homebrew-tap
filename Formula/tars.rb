class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.10"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.10/tars_0.32.10_darwin_arm64.tar.gz"
      sha256 "7cefdb7ba0bcb393b0ebe7dc6406a643298683e2d63d0e0f7208b4af52a280d5"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.10/tars_0.32.10_darwin_amd64.tar.gz"
      sha256 "912eb8b95b00f7ba584868c473d9a535e32e15e0e6a4de241cb3e5f097185ac5"
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
