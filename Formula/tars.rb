class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.36.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.36.0/tars_0.36.0_darwin_arm64.tar.gz"
      sha256 "80974d11aa0acef8e27c5c694a4e11917f082cbffbed3d97f8ca989a24ef1244"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.36.0/tars_0.36.0_darwin_amd64.tar.gz"
      sha256 "3b92c910151e06a930277e38dea91d2ab1b83a64310043c50e1dd6e3a2fd46a6"
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
