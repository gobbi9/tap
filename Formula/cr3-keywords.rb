class Cr3Keywords < Formula
  desc "Local Lightroom AI keywording and captioning pipeline for Canon CR3 photos"
  homepage "https://github.com/gobbi9/cr3-keywords"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.1.0/cr3_0.1.0_darwin-arm64"
      sha256 "01f98188a77023e236c37120448c90f9f2b9f33c2c682c4a999ec7eddef3c7e6"
    else
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.1.0/cr3_0.1.0_darwin-amd64"
      sha256 "9003b35ce36b81c33adb82d6235bfffb7608e59fb87a9d70136584e8c0532e6d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.1.0/cr3_0.1.0_linux-amd64"
      sha256 "1530b88b0a121a63fc7af611fa4ce357026b9ceb81c7892ea2df6a96a10c2fa7"
    else
      odie "Unsupported architecture: #{Hardware::CPU.arch}"
    end
  end

  def install
    bin.install Dir["cr3_0.1.0_*"] .first => "cr3"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/cr3 --help")
  end
end
