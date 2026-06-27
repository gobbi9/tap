class Cr3Keywords < Formula
  desc "Local Lightroom AI keywording and captioning pipeline for Canon CR3 photos"
  homepage "https://github.com/gobbi9/cr3-keywords"
  version "0.2.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.2.4/cr3_0.2.4_darwin-arm64"
      sha256 "f582063f19828226d20ada38850fc3547b8d06df87855006ef78e83b0aeeeab3"
    else
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.2.4/cr3_0.2.4_darwin-amd64"
      sha256 "d36dfb6a82e700f36b1232e7bb86dd926eda86df783282502747e0f4eff777fc"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.2.4/cr3_0.2.4_linux-amd64"
      sha256 "9001d8b1cdd0704370b0f82153ac1fd3a980d45492c71dece64779763daaa345"
    else
      odie "Unsupported architecture: #{Hardware::CPU.arch}"
    end
  end

  depends_on "exiftool"

  resource "manpage" do
    url "https://github.com/gobbi9/cr3-keywords/releases/download/v0.2.4/cr3.1"
    sha256 "7e222e70791d66da2a4c12f73c8d07616bfd9bf510d97caea97806eb7b82c0b6"
  end

  def install
    bin.install Dir["cr3_0.2.4_*"] .first => "cr3"

    resource("manpage").stage do
      man1.install "cr3.1"
    end
  end

  test do
    assert_match "Usage", shell_output("#{bin}/cr3 --help")
  end
end
