class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.35"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.35/tars_0.32.35_darwin_arm64.tar.gz"
      sha256 "4c3fbf80e71c10c3c0a389e7a1c3eecf4272403e490d664d6f411303987da9f3"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.35/tars_0.32.35_darwin_amd64.tar.gz"
      sha256 "43f957abe729b4d9adf32d0b8a75cd36af688627adb539ebdfa53f0ef7df9b08"
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
