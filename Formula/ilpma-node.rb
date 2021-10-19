class IlpmaNode < Formula
  desc "node.js dependency for Ilpma CLI"
  homepage "https://example.com"
  url "https://www.dropbox.com/s/qmo70wnohbz3kts/node-12.22.7.tar.xz?dl=1"
  sha256 "45d47a444f992250c2d0beeedc4884838a2d8bef20b1b4f78cb5ffc1886ace66"

  def install
    libexec.install buildpath/"node"
  end
end
