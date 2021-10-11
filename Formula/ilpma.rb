class Ilpma < Formula
  desc "The Ilpma CLI"
  homepage "https://example.com"
  url "https://github.com/falconandy/homebrew-ilpma/releases/download/v0.1.32/ilpma-v0.1.32.tar.gz"
  version "0.1.32"
  sha256 "a8dcf53381afbbb557b2a8e48d20560addb8521f2e501530bd8ac6cabcbc8a3d"

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
