class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.81"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.81/tars_0.31.81_darwin_arm64.tar.gz"
      sha256 "f08743ead4dc9a99d369111cd904f76f9d645ab73f6a55e32fc0964e5f35759c"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.81/tars_0.31.81_darwin_amd64.tar.gz"
      sha256 "ea50178cc8ab1f58c6aa93cf2253a620af4ac0afdca3bab83259ad5fece509f4"
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
