cask "lumen" do
  version "0.6.6"
  sha256 "f7ce1c109852bc04b26e582984ffdf59e2eb9d00564e39b1eaa40fd5c90d2e21"

  url "https://github.com/prasenjit-net/lumen-editor/releases/download/v#{version}/Lumen-v#{version}-macos-ARM64.dmg"
  name "Lumen"
  desc "Focused native file editor"
  homepage "https://github.com/prasenjit-net/lumen-editor"

  depends_on arch: :arm64

  app "Lumen.app"

  # Published builds are not signed or notarized.
  postflight do
    system_command "/usr/bin/xattr",
         args: ["-dr", "com.apple.quarantine", "#{appdir}/Lumen.app"],
         must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/Lumen",
    "~/Library/Caches/Lumen",
  ]
end
