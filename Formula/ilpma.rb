require "language/node"

class Ilpma < Formula
  desc "..."
  homepage "https://example.com"
  url "https://registry.npmjs.org/@falconandy/ilpma/-/ilpma-0.1.18.tgz"
  sha256 "8abfcf5a430fbe9bf2ac8a5ad26dd1435160790c01253574683b06ac9e8099c4"

  depends_on "node@12"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end

