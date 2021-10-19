class IlpmaDev < Formula
  desc "The Ilpma CLI (Dev)"
  homepage "https://example.com"
  url "https://github.com/falconandy/homebrew-ilpma/releases/download/v0.1.35-master-20211019051440.0/ilpma-v0.1.35-master-20211019051440.0.tar.gz"
  version "0.1.35-master-20211019051440.0"
  sha256 "d9a3710a3ed2edd44b11bbb05eceae9d7a0d0397f1602af065cceee11914840b"

  depends_on "falconandy/ilpma/ilpma-node-dev"

  def install
    inreplace "bin/ilpma", /^CLIENT_HOME=/, "export ILPMA_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/ilpma", "\"$DIR/node\"", "#{Formula["ilpma-node-dev"].libexec}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/ilpma" => "ilpma-dev"
  end

  test do
    system bin/"ilpma-dev", "version"
  end
end
