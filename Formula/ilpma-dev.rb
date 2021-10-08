require "language/node"

class IlpmaDev < Formula
  desc "..."
  homepage "https://example.com"
  url "https://github.com/falconandy/ilpma/releases/download/latest/ilpma-v0.1.19-master-41a0cc4e.0.tar.gz"
  version "0.1.19-master-41a0cc4e.0"
  sha256 "facc2b78b81d42ddb8caeb1ac0272158dc44a51854894667b28412e68c2d3868"

  depends_on "node@12"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/ilpma" => "ilpma-dev"
  end

  test do
    system bin/"ilpma-dev", "version"
  end
end
