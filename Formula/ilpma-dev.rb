require "language/node"

class IlpmaDev < Formula
  desc "..."
  homepage "https://example.com"
  url "https://github.com/falconandy/ilpma/releases/download/latest/ilpma-v0.1.19-master-08dfd095.0.tar.gz"
  sha256 "8abfcf5a430fbe9bf2ac8a5ad26dd1435160790c01253574683b06ac9e8099c4"

  depends_on "node@12"

  def install
    system "npm", "install", *Language::Node.local_npm_install_args
    bin.install_symlink libexec/"bin/ilpma" => "ilpma-dev"
  end

  test do
    system bin/"ilpma-dev", "version"
  end
end
