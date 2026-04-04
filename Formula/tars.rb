class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.20.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.20.0/tars_0.20.0_darwin_arm64.tar.gz"
      sha256 "7320b765938037b1a2fa23d464a7a5a440ad272da0595848f13f4cd147cd9739"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.20.0/tars_0.20.0_darwin_amd64.tar.gz"
      sha256 "ee243b9c644f7c251c9f48341b0f6d68938c80c4ed43185c883096bc0032e098"
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
