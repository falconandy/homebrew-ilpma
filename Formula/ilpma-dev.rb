class IlpmaDev < Formula
  desc "The Ilpma CLI (Dev)"
  homepage "https://example.com"
  url "https://github.com/falconandy/homebrew-ilpma/releases/download/v0.1.36-master-20211019053226.0/ilpma-v0.1.36-master-20211019053226.0.tar.gz"
  version "0.1.36-master-20211019053226.0"
  sha256 "9b4b5fd227e4ab7b0c9ee35ad06f8fbce37af83f6dfa6e8d7e8662f3cad4a124"

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
