class Cr3Keywords < Formula
  desc "Local Lightroom AI keywording and captioning pipeline for Canon CR3 photos"
  homepage "https://github.com/gobbi9/cr3-keywords"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.2.0/cr3_0.2.0_darwin-arm64"
      sha256 "1dbf0a85bd994ad41318712349358aada3c57de112ee1ee9169167243c3b8215"
    else
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.2.0/cr3_0.2.0_darwin-amd64"
      sha256 "d914cad932f08446df2bd4db723251a6fda1f31d5eb6a67baaf20c8af096e5a9"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.2.0/cr3_0.2.0_linux-amd64"
      sha256 "734e5b47ac599e8bdb0a14c0d041ec435496b5c138d6768e62222f66aa5f4185"
    else
      odie "Unsupported architecture: #{Hardware::CPU.arch}"
    end
  end

  def install
    bin.install Dir["cr3_0.2.0_*"] .first => "cr3"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/cr3 --help")
  end
end
