class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.31"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.31/tars_0.31.31_darwin_arm64.tar.gz"
      sha256 "69a1fbafcbda3c49f5b42bec7e135a624a03a9ac6d3e5bf6749547d96a4770bc"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.31/tars_0.31.31_darwin_amd64.tar.gz"
      sha256 "aaf308522067f7ad74e18f117728d73e2a9daf89765089774de738a74457fbe0"
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
