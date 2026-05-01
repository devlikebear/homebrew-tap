class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.99"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.99/tars_0.31.99_darwin_arm64.tar.gz"
      sha256 "8fa08908532acf861dd152d208ceab9573ada60fe2b41e69c402a241658ab08e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.99/tars_0.31.99_darwin_amd64.tar.gz"
      sha256 "57e2b56acb97e400c8a92d31e7d581389d51586ee2c6ea9d9ed7f74eb257be70"
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
