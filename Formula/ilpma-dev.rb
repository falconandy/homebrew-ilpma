class IlpmaDev < Formula
  desc "The Ilpma CLI (Dev)"
  homepage "https://example.com"
  url "https://github.com/falconandy/homebrew-ilpma/releases/download/v0.1.35-master-20211012174613.0/ilpma-v0.1.35-master-20211012174613.0.tar.gz"
  version "0.1.35-master-20211012174613.0"
  sha256 "a89774572c289a10ecb694d2e3d0f00cf259c94bb6d7e8e5a6c0d2d06c22827f"

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
