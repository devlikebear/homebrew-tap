class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.31.38"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.31.38/tars_0.31.38_darwin_arm64.tar.gz"
      sha256 "62f322c203a4d0b8336064d50779cab4192bfb3ae6973dc10aaa670d2974b379"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.31.38/tars_0.31.38_darwin_amd64.tar.gz"
      sha256 "7b6cabb86b7c7bdf5f734b6992dc871574c4aa302522aecfdbcedab87e8e1cd1"
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
