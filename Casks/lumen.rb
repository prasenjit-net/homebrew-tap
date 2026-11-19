cask "lumen" do
  version "0.6.4"
  sha256 "c6913a273bae6cec4b6a310ba840d9a526a50d7c1e2d48311f12910d94c15a36"

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
