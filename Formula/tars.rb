class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.28.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.28.5/tars_0.28.5_darwin_arm64.tar.gz"
      sha256 "5ecb19fa23168c7b18d2a050b74fde4d6556af3b90af62420f59d9e750421b4b"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.28.5/tars_0.28.5_darwin_amd64.tar.gz"
      sha256 "e68edcc996f08cfb70563818fac871fbaefa02013105b4b7ec716edc19e087e8"
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
