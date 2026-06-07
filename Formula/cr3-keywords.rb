class Cr3Keywords < Formula
  desc "Local Lightroom AI keywording and captioning pipeline for Canon CR3 photos"
  homepage "https://github.com/gobbi9/cr3-keywords"
  version "0.2.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.2.3/cr3_0.2.3_darwin-arm64"
      sha256 "00a9fbb7c30cda3e67c32b46b21511c58ac79c576c7ef7d3085289a88d04f854"
    else
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.2.3/cr3_0.2.3_darwin-amd64"
      sha256 "488227c15a3c00d1b1cf84628d1cdc2a7f53975fc90e9ef11592ddb19186066c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.2.3/cr3_0.2.3_linux-amd64"
      sha256 "e90eaad1ec288257979157805ffdb2303096f7be73cf36c1acb60b98a09ecf2b"
    else
      odie "Unsupported architecture: #{Hardware::CPU.arch}"
    end
  end

  def install
    bin.install Dir["cr3_0.2.3_*"] .first => "cr3"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/cr3 --help")
  end
end
