class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.32.20"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.32.20/tars_0.32.20_darwin_arm64.tar.gz"
      sha256 "92a2eb67160b6500b3951ef12d55179253725454fd9403a4ee954a6151f19b61"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.32.20/tars_0.32.20_darwin_amd64.tar.gz"
      sha256 "3bddb0ec85427444d526dc09f972b38a92635063738ab6321db1e97f93bd403c"
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
