class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.25/tars_0.31.25_darwin_arm64.tar.gz"
      sha256 "529ab793d36193004459e0634f20f2f4faa9821461153fbfa1af5ac6e14ae693"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.25/tars_0.31.25_darwin_amd64.tar.gz"
      sha256 "3e238aae44dd48cd298b9fc8e9781a549a462870a4d6399a7099d70f7ff94883"
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
