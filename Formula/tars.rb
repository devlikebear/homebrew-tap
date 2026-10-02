class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.43.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.43.1/tars_0.43.1_darwin_arm64.tar.gz"
      sha256 "1b39b33e417b138ab92f11646462c89bdcece474f2fd2fba343050421a81e002"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.43.1/tars_0.43.1_darwin_amd64.tar.gz"
      sha256 "8db01035a2b4af39fc3aa41d78e138be1895557e2d44b1245cff1a12231e0edd"
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
