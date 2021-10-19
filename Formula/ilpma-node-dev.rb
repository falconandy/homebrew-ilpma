class IlpmaNodeDev < Formula
  desc "node.js dependency for Ilpma CLI (Dev)"
  homepage "https://example.com"
  url "https://file.io/AiWBbPgjVGLR"
  sha256 "20336250cfcfe3e84bcbea457f0aa5f325eb020f3a86e972d36d9ab0e331ece0"
  version "12.22.8"

  def install
    libexec.install buildpath/"node"
  end
end
