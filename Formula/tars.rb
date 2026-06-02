class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.33.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.33.4/tars_0.33.4_darwin_arm64.tar.gz"
      sha256 "0c14a6231235e8ff20d0596b4ea807921aba3be88aeec2cf16ad3beefba34a59"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.33.4/tars_0.33.4_darwin_amd64.tar.gz"
      sha256 "a8bc7fb1c411dfd905ae78b6fb74c83963351f53c48e6f97fb0bd3740115668c"
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
