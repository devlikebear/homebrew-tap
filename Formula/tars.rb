class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.47.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.47.4/tars_0.47.4_darwin_arm64.tar.gz"
      sha256 "237e06497ad5ed28dbd637fbd79dd58e10131b31da0529a6ff195f2232648f03"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.47.4/tars_0.47.4_darwin_amd64.tar.gz"
      sha256 "6d2e0377223baf13614f364333246df45fb73e90b73af039d17f1d87da36f9d8"
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

      For the desktop app (tray, approval notifications, its own window):
        brew install --cask devlikebear/tap/tars-desktop
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tars --version")
  end
end
