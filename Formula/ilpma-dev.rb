require "language/node"

class IlpmaDev < Formula
  desc "..."
  homepage "https://example.com"
  url "https://github.com/falconandy/ilpma/releases/download/latest/ilpma-v0.1.19-master-19afddc6.0.tar.gz"
  version "0.1.19-master-19afddc6.0"
  sha256 "9c4c8dde9f76aaf87878db0536cbd4ef15b6e6310a7b616bbc46a5ead1ec44b4"

  depends_on "node@12"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/ilpma" => "ilpma-dev"
  end

  test do
    system bin/"ilpma-dev", "version"
  end
end
