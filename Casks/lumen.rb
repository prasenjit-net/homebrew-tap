cask "lumen" do
  version "0.6.3"
  sha256 "9d7959e43da886d3a514e14d060e48596054d0f66b3ea858bfb1d2b0a677ca43"

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
