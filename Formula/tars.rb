class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.48"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.48/tars_0.31.48_darwin_arm64.tar.gz"
      sha256 "d751ff98f4e50e898b574a5ac6d3cad5f5108eb55b94d7c1ddce467285b24d6a"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.48/tars_0.31.48_darwin_amd64.tar.gz"
      sha256 "3e8776ca823de9a7d0a80bfc3e61f6c862b6ad69d27ba82d2f1c11d79f0764e5"
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
