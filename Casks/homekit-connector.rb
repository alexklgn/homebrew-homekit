cask "homekit-connector" do
  version "1.0.1"
  sha256 "c86b9bccd199cc8b3bdf181fa9907b79b34bc52f2210313119483813a8ee0cb1"

  url "https://github.com/alexklgn/HomekitConnector/releases/download/v#{version}/HomekitConnector.dmg"
  name "HomekitConnector"
  desc "A macOS menubar app for HomeKit control"
  homepage "https://github.com/alexklgn/HomekitConnector"

  app "HomekitConnector.app"

  caveats <<~EOS
    HomekitConnector is a macOS menubar app for HomeKit control.
    The app is properly notarized with Apple, so you can open it directly.
  EOS
end