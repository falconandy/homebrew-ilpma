require "language/node"

class IlpmaDev < Formula
  desc "The Ilpma CLI (Dev)"
  homepage "https://example.com"
  url "https://github.com/falconandy/ilpma/releases/download/latest/ilpma-v0.1.31-master-20211009144030.0.tar.gz"
  version "0.1.31-master-20211009144030.0"
  sha256 "a40bba0008161c3440852cbb54db68a0850a160d0e2a43ce40ec29859f05b79a"

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
