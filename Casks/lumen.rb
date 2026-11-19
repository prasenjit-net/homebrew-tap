cask "lumen" do
  version "0.6.2"
  sha256 "8ed60a5d687109dd722b9a54d59f92dc29e04418ee2df9d531deb9891643d953"

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
