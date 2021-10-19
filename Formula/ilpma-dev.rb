class IlpmaDev < Formula
  desc "The Ilpma CLI (Dev)"
  homepage "https://example.com"
  url "https://github.com/falconandy/homebrew-ilpma/releases/download/v0.1.36-master-20211019053111.0/ilpma-v0.1.36-master-20211019053111.0.tar.gz"
  version "0.1.36-master-20211019053111.0"
  sha256 "359c6cebab93f1c52d3ee230ff1ee06fa04b3adbdaad03603e0d24d81bdf908d"

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
