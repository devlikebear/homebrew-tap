class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.5/tars_0.32.5_darwin_arm64.tar.gz"
      sha256 "443f3d12356bbe3eb7f81af634e39b77e6b14181f8f46528eb2fe175de85e006"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.5/tars_0.32.5_darwin_amd64.tar.gz"
      sha256 "b2a2b9d6e544f2b041a1e38ba2e5703bf496ef23469a414967589897f35c9df1"
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
