class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.45.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.45.7/tars_0.45.7_darwin_arm64.tar.gz"
      sha256 "c27177a5c455d0ff879431eecc459a95102d2e16c0d1de7ffab46d2cbd05509c"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.45.7/tars_0.45.7_darwin_amd64.tar.gz"
      sha256 "b5fb4a5fd7ab271ef6945eb201c7fa31a11c43e82519e3d821336d702370088e"
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
