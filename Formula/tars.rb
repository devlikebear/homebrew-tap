class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.9.0/tars_0.9.0_darwin_arm64.tar.gz"
      sha256 "a61fb6aa4d7efe3026ac8a6e6aabc306ced46c743366dc68f58cddffbce4782b"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.9.0/tars_0.9.0_darwin_amd64.tar.gz"
      sha256 "ff9e2cb58d84a35acd6b9ea3d7f7042a59d2dae759cfa635e06d31560b35bdab"
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
