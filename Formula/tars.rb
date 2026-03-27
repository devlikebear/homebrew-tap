class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.12.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.12.0/tars_0.12.0_darwin_arm64.tar.gz"
      sha256 "b45055d247cb778c69bf0df104c2201e5ad63be08e733691cff2d21364bd3ffa"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.12.0/tars_0.12.0_darwin_amd64.tar.gz"
      sha256 "2ad3c0cf04f9a40cfacda97284208715e26190e64a0dbdfe0abd6627afe42d82"
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
