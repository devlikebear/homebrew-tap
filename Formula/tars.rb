class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.21.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.21.0/tars_0.21.0_darwin_arm64.tar.gz"
      sha256 "8f673dd869e7c740c6a49d7c17558859a897259e5536a5e217bd08355cfca1e8"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.21.0/tars_0.21.0_darwin_amd64.tar.gz"
      sha256 "4f438139f9d8bc524ac25edfc0191c205dbf81ee270a05bcb086df939b5518fe"
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
