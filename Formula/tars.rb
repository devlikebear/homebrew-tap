class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.159"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.159/tars_0.31.159_darwin_arm64.tar.gz"
      sha256 "d5f120052c05979f318b495dcdc752a0ecffa17215cdbe6f2210e3202147f164"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.159/tars_0.31.159_darwin_amd64.tar.gz"
      sha256 "c70f06921a89d340a07ee1af88b4b80edcf52c4abb42d1b9a08cb9eeda2b424f"
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
