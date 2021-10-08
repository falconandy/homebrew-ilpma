require "language/node"

class IlpmaDev < Formula
  desc "..."
  homepage "https://example.com"
  url "https://github.com/falconandy/ilpma/releases/download/latest/ilpma-v0.1.19-master-08dfd095.0.tar.gz"
  sha256 "facc2b78b81d42ddb8caeb1ac0272158dc44a51854894667b28412e68c2d3868"

  depends_on "node@12"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"ilpma-dev", "version"
  end
end
