class Cr3Keywords < Formula
  desc "Local Lightroom AI keywording and captioning pipeline for Canon CR3 photos"
  homepage "https://github.com/gobbi9/cr3-keywords"
  version "0.2.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.2.1/cr3_0.2.1_darwin-arm64"
      sha256 "dec03ef9b6bdc6314e53e2c3d2529274810616a0dabfeffc6e4caa22f672e3cb"
    else
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.2.1/cr3_0.2.1_darwin-amd64"
      sha256 "2508986e1a6ba24980a4bfe3563854ff99788f165c8dbde228b88208f664c4da"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.2.1/cr3_0.2.1_linux-amd64"
      sha256 "718a9993ad2c62e939426c688be3c0d1e958753a0176612e332b6401fa80538f"
    else
      odie "Unsupported architecture: #{Hardware::CPU.arch}"
    end
  end

  def install
    bin.install Dir["cr3_0.2.1_*"] .first => "cr3"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/cr3 --help")
  end
end
