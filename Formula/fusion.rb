class Fusion < Formula
  desc "Fusion — AI-orchestrated task board. From rough idea to production code, automatically"
  homepage "https://runfusion.ai"
  url "https://registry.npmjs.org/@runfusion/fusion/-/fusion-0.38.1.tgz"
  sha256 "b58993cf33ca385308ffe7f1556d05a36db066ddd5f30bbdc371d17ef00d90ef"
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
