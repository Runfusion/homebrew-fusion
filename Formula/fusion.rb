class Fusion < Formula
  desc "Fusion — AI-orchestrated task board. From rough idea to production code, automatically"
  homepage "https://runfusion.ai"
  url "https://registry.npmjs.org/@runfusion/fusion/-/fusion-0.77.0.tgz"
  sha256 "dcd8d856e170783e2f6e82176dd2bcfcba48533b75321914a6647b8c646d8f10"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/fusion", libexec/"bin/fn"
  end

  test do
    assert_match "Fusion", shell_output("#{bin}/fn --help")
  end
end
