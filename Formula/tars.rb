class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.87"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.87/tars_0.31.87_darwin_arm64.tar.gz"
      sha256 "9af4074455bee766843ddf57ed66e0b4e5846c0fbb1c318dd419efff4210cd36"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.87/tars_0.31.87_darwin_amd64.tar.gz"
      sha256 "12fd68501af796ec2747ee2cb3e43bdbc4fff88fb315706ae9e9fa8d16b7fde1"
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
