class Ilpma < Formula
  desc "The Ilpma CLI"
  homepage "https://example.com"
  url "https://github.com/falconandy/homebrew-ilpma/releases/download/v0.1.34/ilpma-v0.1.34.tar.gz"
  version "0.1.34"
  sha256 "79860fecc69194feff747dcff9324afb7083c9bb9956ed3de7aee69726b9327c"

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
