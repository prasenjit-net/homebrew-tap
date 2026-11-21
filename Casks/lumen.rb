cask "lumen" do
  version "0.6.5"
  sha256 "c0e32387af9b0f9cf16001368042247324e516cd98b645c1edac11522065459b"

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
