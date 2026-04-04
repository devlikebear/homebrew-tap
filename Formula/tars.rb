class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.15.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.15.0/tars_0.15.0_darwin_arm64.tar.gz"
      sha256 "1384c4ea7ed852088a4a1aef3f7868a254f8b8109526740465115fdefa8a24ea"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.15.0/tars_0.15.0_darwin_amd64.tar.gz"
      sha256 "238e1697f64098af265271a2f3ad74303d4f070b12a8c3a28d69f9759e2de728"
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
