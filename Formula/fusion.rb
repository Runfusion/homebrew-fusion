class Fusion < Formula
  desc "Fusion — AI-orchestrated task board. From rough idea to production code, automatically"
  homepage "https://runfusion.ai"
  url "https://registry.npmjs.org/@runfusion/fusion/-/fusion-0.70.0.tgz"
  sha256 "f1d0a053a5048fec476aed904b102e80b2100e22d555d3ceca91c0d12139ca48"
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
