require "language/node"

class IlpmaDev < Formula
  desc "..."
  homepage "https://example.com"
  url "https://github.com/falconandy/ilpma/releases/download/latest/ilpma-v0.1.19-master-19afddc6.0.tar.gz"
  version "0.1.19-master-19afddc6.0"
  sha256 "6efd480dc48478fe174f34da30e7e7a9621308bdc900c45c820ca8349598e14b"

  depends_on "node@12"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/ilpma" => "ilpma-dev"
  end

  test do
    system bin/"ilpma-dev", "version"
  end
end
