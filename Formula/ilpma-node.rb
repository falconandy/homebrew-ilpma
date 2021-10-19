class IlpmaNode < Formula
  desc "node.js dependency for Ilpma CLI"
  homepage "https://example.com"
  url "https://file.io/shzX3eR3c2RU"
  sha256 "45d47a444f992250c2d0beeedc4884838a2d8bef20b1b4f78cb5ffc1886ace66"
  version "12.22.7"

  def install
    libexec.install buildpath/"node"
  end
end
