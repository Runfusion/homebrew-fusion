class Fusion < Formula
  desc "Fusion — AI-orchestrated task board. From rough idea to production code, automatically"
  homepage "https://runfusion.ai"
  url "https://registry.npmjs.org/@runfusion/fusion/-/fusion-0.72.0.tgz"
  sha256 "65fff8e14c7a160cf5733b3c2f1e2c1a2a7b12121b7efdfcf513c11a5404a349"
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
