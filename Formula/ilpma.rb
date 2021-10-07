require "language/node"

class Ilpma < Formula
  desc "..."
  homepage "https://example.com"
  url "https://registry.npmjs.org/@falconandy/ilpma/-/ilpma-0.1.18.tgz"
  sha256 "9fb0f17d9d378fc8be5f7d825c34e45a3e090e0e"

  depends_on "node@12"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end
end

