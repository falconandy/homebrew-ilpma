require "language/node"

class IlpmaDev < Formula
  desc "The Ilpma CLI (Dev)"
  homepage "https://example.com"
  url "https://github.com/falconandy/ilpma/releases/download/latest/ilpma-v0.1.29-master-20211009142821.0.tar.gz"
  version "0.1.29-master-20211009142821.0"
  sha256 "120eb462a9c641770176e5b91d55e68342d1e6cf80b061228f3d3c65c801ee1c"

  depends_on "node@12"

  def install
    inreplace "bin/ilpma", /^CLIENT_HOME=/, "export ILPMA_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/ilpma", "\"$DIR/node\"", "#{Formula["node@12"].bin}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/ilpma" => "ilpma-dev"
  end

  test do
    system bin/"ilpma-dev", "version"
  end
end
