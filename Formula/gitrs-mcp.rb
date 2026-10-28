class GitrsMcp < Formula
  desc "A local-only Git MCP server built on gitoxide: structured, git-compatible tools, resources and prompts for AI assistants"
  homepage "https://github.com/prasenjit-net/gitrs-mcp"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/prasenjit-net/gitrs-mcp/releases/download/v0.1.0/gitrs-mcp-aarch64-apple-darwin.tar.gz"
      sha256 "f2bbd7ef2f93f82d22736ae260091a94068bc11081a5399c704b3498b3c1f3e1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/prasenjit-net/gitrs-mcp/releases/download/v0.1.0/gitrs-mcp-x86_64-apple-darwin.tar.gz"
      sha256 "9c1ce4a3870d03e742cce74f8b004ea16fb1e82eceebf74292d39c73f77b9cc9"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/prasenjit-net/gitrs-mcp/releases/download/v0.1.0/gitrs-mcp-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "85ee7afd4f95b1dcbc570dddb3ce2707d2748e38790b920a9850ec160a2238ba"
    end
    if Hardware::CPU.intel?
      url "https://github.com/prasenjit-net/gitrs-mcp/releases/download/v0.1.0/gitrs-mcp-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f360b34cbce40aea2dcfe24f03f01d42c979e253b9054ca89e44da7ff6084752"
    end
  end
  license any_of: ["MIT", "Apache-2.0"]

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "gitrs-mcp"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "gitrs-mcp"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "gitrs-mcp"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "gitrs-mcp"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
