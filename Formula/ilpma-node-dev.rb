class IlpmaNodeDev < Formula
  desc "node.js dependency for Ilpma CLI (Dev)"
  homepage "https://example.com"
  url "https://github.com/falconandy/homebrew-ilpma/releases/download/v0.1.34/node-12.22.7.tar.xz"
  sha256 "45d47a444f992250c2d0beeedc4884838a2d8bef20b1b4f78cb5ffc1886ace66"
  version "12.22.9"

  def install
    libexec.install buildpath/"node"
  end
end
