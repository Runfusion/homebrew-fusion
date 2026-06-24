class Fusion < Formula
  desc "Fusion — AI-orchestrated task board. From rough idea to production code, automatically"
  homepage "https://runfusion.ai"
  url "https://registry.npmjs.org/@runfusion/fusion/-/fusion-0.46.0.tgz"
  sha256 "e11a161c9b8656a600184425d1cdf9e34526f31d9a10f80e43e4a401110e8107"
  license "MIT"

  depends_on "node"

  # Without this, Homebrew's relocation would expand the @rpath dylib ID set in
  # `install` back to the long opt path, which doesn't fit the Mach-O header —
  # the original "Failed to fix install linkage" failure.
  preserve_rpath

  def install
    system "npm", "install", *std_npm_args

    # The bundled @mariozechner/clipboard-darwin-universal prebuilt addon ships
    # with an absolute CI build path as its LC_ID_DYLIB and no Mach-O header
    # padding, so Homebrew's relocation can't rewrite that ID. It is only a
    # self-reference (Node dlopens the addon by path), so normalize it to a
    # short @rpath name that fits the header, then re-sign ad-hoc.
    addons = Dir.glob("#{libexec}/**/clipboard.darwin-universal.node")
    odie "clipboard.darwin-universal.node addon not found" if addons.empty?

    addons.each do |node|
      MachO::Tools.change_dylib_id(node, "@rpath/#{File.basename(node)}")
      system "codesign", "--force", "--sign", "-", node
    end

    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Fusion", shell_output("#{bin}/fn --help")
  end
end
