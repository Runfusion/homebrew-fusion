class Fusion < Formula
  desc "Fusion — AI-orchestrated task board. From rough idea to production code, automatically"
  homepage "https://runfusion.ai"
  url "https://registry.npmjs.org/@runfusion/fusion/-/fusion-0.34.0.tgz"
  sha256 "68d07a8393ad3f7e1ce3d7ef06ce289aeaed1fbbb1e5c80dcabb4f5a4fd3141b"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Fusion", shell_output("#{bin}/fn --help")
  end
end
