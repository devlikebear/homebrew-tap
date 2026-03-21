class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.7.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.7.1/tars_0.7.1_darwin_arm64.tar.gz"
      sha256 "7f449f1f9be6ad8eabb24f756abf785f6c5a13c2374f67d7d74c05de12cb3c2e"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.7.1/tars_0.7.1_darwin_amd64.tar.gz"
      sha256 "47d93ef3afdd47968d73985580a7b2a0ad43938b8407e251aafcba08a92e250c"
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
