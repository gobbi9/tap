class Cr3Keywords < Formula
  desc "Local Lightroom AI keywording and captioning pipeline for Canon CR3 photos"
  homepage "https://github.com/gobbi9/cr3-keywords"
  version "0.2.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.2.2/cr3_0.2.2_darwin-arm64"
      sha256 "19741fc2147d7302fe180278dcaac3bb3554aca40ba25cd9b8a5657e1fc16d5f"
    else
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.2.2/cr3_0.2.2_darwin-amd64"
      sha256 "dd2a88e01e78501f20e3eced9e70a5e2b0e604f44c6a7b04072517def0c2158d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.2.2/cr3_0.2.2_linux-amd64"
      sha256 "9d247c09fa01fef0b8047ffce1bc8c8327eadcc8d517d5da2d21f1a61dfc420a"
    else
      odie "Unsupported architecture: #{Hardware::CPU.arch}"
    end
  end

  def install
    bin.install Dir["cr3_0.2.2_*"] .first => "cr3"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/cr3 --help")
  end
end
