class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.85"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.85/tars_0.31.85_darwin_arm64.tar.gz"
      sha256 "326385597a85a7bfee41cb061783498ddd09fbd3d8707e9aafc3bb196a74e135"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.85/tars_0.31.85_darwin_amd64.tar.gz"
      sha256 "d1e258bd88ee6379279bc36c7db7c06e3d7eb6fed7556e5282a74cd45be97a3d"
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
