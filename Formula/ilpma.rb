require "language/node"

class Ilpma < Formula
  desc "The Ilpma CLI"
  homepage "https://example.com"
  url "https://github.com/falconandy/ilpma/releases/download/v0.1.29/ilpma-v0.1.29.tar.gz"
  version "0.1.29"
  sha256 "2fd59aa60d80ff441cb91a6a917799688395490b10a734e705605ce2af0f7e34"

  depends_on "node@12"

  def install
    inreplace "bin/ilpma", /^CLIENT_HOME=/, "export ILPMA_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    inreplace "bin/ilpma", "\"$DIR/node\"", "#{Formula["node@12"].bin}/node"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/ilpma" => "ilpma"
  end

  test do
    system bin/"ilpma", "version"
  end
end
