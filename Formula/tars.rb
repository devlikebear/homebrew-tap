class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.145"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.145/tars_0.31.145_darwin_arm64.tar.gz"
      sha256 "856ad58214e3562bf149c59e3bd013097ff9dd2095c7586c0d760ec0edf72f2b"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.145/tars_0.31.145_darwin_amd64.tar.gz"
      sha256 "5f3aca37d77d4c2c1231fb21526d56f9d7d09c52f2cc4e2ebc511b018d0ece7a"
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
