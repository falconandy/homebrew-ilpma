class IlpmaDev < Formula
  desc "The Ilpma CLI (Dev)"
  homepage "https://example.com"
  url "https://github.com/falconandy/homebrew-ilpma/releases/download/latest/ilpma-v0.1.34-master-20211011175214.0.tar.gz"
  version "0.1.34-master-20211011175214.0"
  sha256 "e785e0822814a49bc6c1af57f46b3690c3cad980f4535ccf8dacf7b4aecd5afb"

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
