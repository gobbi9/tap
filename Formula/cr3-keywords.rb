class Cr3Keywords < Formula
  desc "Local Lightroom AI keywording and captioning pipeline for Canon CR3 photos"
  homepage "https://github.com/gobbi9/cr3-keywords"
  version "0.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.0.1/cr3_0.0.1_darwin-arm64"
      sha256 "REPLACE_WITH_SHA256_DARWIN_ARM64"
    else
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.0.1/cr3_0.0.1_darwin-amd64"
      sha256 "REPLACE_WITH_SHA256_DARWIN_AMD64"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.0.1/cr3_0.0.1_linux-amd64"
      sha256 "REPLACE_WITH_SHA256_LINUX_AMD64"
    else
      odie "Unsupported architecture: #{Hardware::CPU.arch}"
    end
  end

  def install
    bin.install Dir["cr3_0.0.1_*"] .first => "cr3"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/cr3 --help")
  end
end
