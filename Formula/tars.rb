class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.24.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.24.1/tars_0.24.1_darwin_arm64.tar.gz"
      sha256 "08c58fb2fba5959710b45fbe630850dd1a1f7f792959c31ca31616bd121aae01"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.24.1/tars_0.24.1_darwin_amd64.tar.gz"
      sha256 "92b938f46ba999e3002f9169caf230d88f1b6b98ba5a184b70f062f944331c29"
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
