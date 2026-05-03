class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.130"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.130/tars_0.31.130_darwin_arm64.tar.gz"
      sha256 "016677da37ad780f050af75e8b2f10e37a8e89f8916f860ff30c9ce6a2acaed3"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.130/tars_0.31.130_darwin_amd64.tar.gz"
      sha256 "9359e678204d23962e3384e46e3a81f7c8bbcfedbc8c0fd310f64561a9533132"
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
