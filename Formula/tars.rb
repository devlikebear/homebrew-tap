class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.40.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.40.1/tars_0.40.1_darwin_arm64.tar.gz"
      sha256 "cc0b3e08de527169c00c3f0f0ccfaccf243a931d92346f08767cb321cfd22f52"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.40.1/tars_0.40.1_darwin_amd64.tar.gz"
      sha256 "8b15c1d22dd60c69f4067390155b9a464e6f5f08fd3f022b0a85265e225d137c"
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
