class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.33.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.33.0/tars_0.33.0_darwin_arm64.tar.gz"
      sha256 "5e7338775e63bc9955229b55b084580c91ab6caf7da45c92cefa5d2ac5c1c3b6"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.33.0/tars_0.33.0_darwin_amd64.tar.gz"
      sha256 "5ee80e0ee8d7660b16c3f3606f155ad29fef4003fac36c78a1d144deb768a3d6"
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
