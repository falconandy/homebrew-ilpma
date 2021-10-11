class IlpmaDev < Formula
  desc "The Ilpma CLI (Dev)"
  homepage "https://example.com"
  url "https://github.com/falconandy/homebrew-ilpma/releases/download/latest/ilpma-v0.1.31-master-20211011173239.0.tar.gz"
  version "0.1.31-master-20211011173239.0"
  sha256 "317d0c9b2da352a451d2f99b8396052c89df1e36b1c6a5d2995434c7b113170a"

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
