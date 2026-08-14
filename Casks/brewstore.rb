cask "brewstore" do
  version "1.3.9"
  sha256 "2ad8c67730a621db7b3392bcc349f6928d6aca76000cda93ce4e98a47a39099b"

  url "https://github.com/manishvagh/BrewStore-by-Manish-Vagh/releases/download/v#{version}/BrewStore-#{version}-arm64.dmg",
      verified: "github.com/manishvagh/BrewStore-by-Manish-Vagh/"
  name "BrewStore"
  desc "App Store–style GUI for Homebrew"
  homepage "https://brewstore.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey
  depends_on arch: :arm64

  app "BrewStore.app"

  # Unsigned build — clear Gatekeeper quarantine so first launch works.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/BrewStore.app"]
  end

  zap trash: [
    "~/Library/Application Support/BrewStore",
    "~/Library/Preferences/app.manishvagh.brewstore.plist",
    "~/Library/Saved Application State/app.manishvagh.brewstore.savedState",
  ]

  caveats <<~EOS
    BrewStore is unsigned (no Apple Developer ID). The cask clears quarantine
    on install. If macOS still blocks it, right-click Open, or run:
      xattr -cr #{appdir}/BrewStore.app
  EOS
end
