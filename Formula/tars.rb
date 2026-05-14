class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.56"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.56/tars_0.32.56_darwin_arm64.tar.gz"
      sha256 "7ddcbaecb199cd3a442ca88acbf68394664ce46878130c5608fab3cae8c83097"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.56/tars_0.32.56_darwin_amd64.tar.gz"
      sha256 "1ed18b203b5bdc033a4dced1119221a188d7f6c07052382f9c9ab9a846d237dc"
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
