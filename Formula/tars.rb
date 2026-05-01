class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.117"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.117/tars_0.31.117_darwin_arm64.tar.gz"
      sha256 "b1e6fc35de1cd26eb04579faf6db142aa39bc185b181e97678381317795d973d"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.117/tars_0.31.117_darwin_amd64.tar.gz"
      sha256 "245521ee95460ada6e957c9eeb76eb2bbbec4ca6b8b9b4067f4aba8cf6d64bce"
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
