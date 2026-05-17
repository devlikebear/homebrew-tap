class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.68"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.68/tars_0.32.68_darwin_arm64.tar.gz"
      sha256 "cca82ce019d7f0fa48414d135852afb46b2ad108920e660153b0fc2f41080225"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.68/tars_0.32.68_darwin_amd64.tar.gz"
      sha256 "75818c1cf16374ed8d688e95540730b8bae3fff10cd5aad2aa73df614cfa91e7"
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
