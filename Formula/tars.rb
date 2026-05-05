class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.175"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.175/tars_0.31.175_darwin_arm64.tar.gz"
      sha256 "dafd28edd9edbd6097be6b3d294c5508ad6f198a6af032b70ec8e53252d90eda"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.175/tars_0.31.175_darwin_amd64.tar.gz"
      sha256 "dd9becbc0323852f77c74bad31ba4a06eee008b2934ec8469591ed341d676e59"
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
