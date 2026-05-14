class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.63"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.63/tars_0.32.63_darwin_arm64.tar.gz"
      sha256 "75c8870cd2c927758e5fa350912a9a3a7b171fbf76e17905e0a58331763e6b83"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.63/tars_0.32.63_darwin_amd64.tar.gz"
      sha256 "29f93b534692c3f55daf0b85b7c5a48224ab463820e1efcf69395bbe2ac6bb31"
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
