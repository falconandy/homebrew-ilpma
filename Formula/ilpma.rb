class Ilpma < Formula
  desc "The Ilpma CLI"
  homepage "https://example.com"
  url "https://github.com/falconandy/homebrew-ilpma/releases/download/v0.1.35/ilpma-v0.1.35.tar.gz"
  version "0.1.35"
  sha256 "8e72a51178f54ae17c7d8492297df26b17bdc2a620591b57ae4916dd9cbc4a77"

  depends_on "falconandy/ilpma/ilpma-node"

  def install
    inreplace "bin/ilpma", /^CLIENT_HOME=/, "export ILPMA_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/ilpma", "\"$DIR/node\"", "#{Formula["ilpma-node"].libexec}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/ilpma" => "ilpma"
  end

  test do
    system bin/"ilpma", "version"
  end
end
