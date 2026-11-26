cask "teleclip" do
  version "1.2.0"
  sha256 "ca518102fec5179e5726df3bc63382f7bcdd2535e77be748d0ea0bd26642c81b"

  url "https://github.com/parktaeyang/Teleclip/releases/download/v#{version}/Teleclip-#{version}.zip"
  name "Teleclip"
  desc "Menu bar OCR that copies on-screen text to the clipboard"
  homepage "https://github.com/parktaeyang/Teleclip"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Teleclip.app"

  uninstall quit: "io.github.parktaeyang.teleclip"

  zap trash: [
    "~/Library/Caches/io.github.parktaeyang.teleclip",
    "~/Library/HTTPStorages/io.github.parktaeyang.teleclip",
    "~/Library/Preferences/com.teleclip.app.plist",
    "~/Library/Preferences/io.github.parktaeyang.teleclip.plist",
    "~/Library/Saved Application State/io.github.parktaeyang.teleclip.savedState",
  ]

  caveats <<~EOS
    Teleclip needs Screen Recording permission to read text from the screen.
    Teleclip asks for it on first launch; after allowing it in System Settings, use the restart item in the menu bar icon menu.

    This build is self-signed and is not notarized by Apple, so macOS may block the first launch.
    macOS 15 and later: open System Settings > Privacy & Security and click "Open Anyway".
    (macOS 14 and earlier: right-click the app in Applications and choose Open.)

    No security settings are changed by this cask.
  EOS
end
