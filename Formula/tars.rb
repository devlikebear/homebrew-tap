class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.137"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.137/tars_0.31.137_darwin_arm64.tar.gz"
      sha256 "6f9b9c9a98dbb1dc6c378824c5d1645f776a1ce535dcf8fadcbaa8bc80864377"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.137/tars_0.31.137_darwin_amd64.tar.gz"
      sha256 "564b2dfb2a971cc56ff5f736c1b39130d252dd0ec665dc2be7798e30b3ae6a02"
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
