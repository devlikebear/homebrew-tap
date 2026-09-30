class Tars < Formula
  desc "Local-first automation runtime written in Go"
  homepage "https://github.com/devlikebear/tars"
  version "0.40.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/devlikebear/tars/releases/download/v0.40.5/tars_0.40.5_darwin_arm64.tar.gz"
      sha256 "21ad0c47cf96132460eecf8dc6c7cc8f1c0e33c54ca1634ff80d2efda610494c"
    else
      url "https://github.com/devlikebear/tars/releases/download/v0.40.5/tars_0.40.5_darwin_amd64.tar.gz"
      sha256 "463a498aa799a3a2f97f82f64ee11866068f4790cc6971f1edc45373b7501753"
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
