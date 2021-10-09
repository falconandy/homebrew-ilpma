require "language/node"

class IlpmaDev < Formula
  desc "The Ilpma CLI (Dev)"
  homepage "https://example.com"
  url "https://github.com/falconandy/ilpma/releases/download/latest/ilpma-v0.1.19-master-19afddc6.0.tar.gz"
  version "0.1.19"
  sha256 "9c4c8dde9f76aaf87878db0536cbd4ef15b6e6310a7b616bbc46a5ead1ec44b4"

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
