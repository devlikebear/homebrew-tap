class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.155"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.155/tars_0.31.155_darwin_arm64.tar.gz"
      sha256 "ac08ad8cf56c2110de3d5bd25936dc12a688b8df242a433d0485937d821d2b7f"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.155/tars_0.31.155_darwin_amd64.tar.gz"
      sha256 "08f3b1f3b839adddedeeaef80b364f3ed2d9fe2a648a6a5fe88e2e73e45db269"
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
