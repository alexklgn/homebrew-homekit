cask "homekit-connector" do
  version "1.0.0"
  sha256 "1a2bc7a8ce42724f2049ba9cf744a1889f1206b5dc22adc88f49189000186a6d"

  url "https://github.com/alexklgn/homebrew-homekit/raw/main/HomekitConnector.dmg"
  name "HomekitConnector"
  desc "A macOS menubar app for HomeKit control"
  homepage "https://github.com/alexklgn/HomekitConnector"

  app "HomekitConnector.app"

  caveats <<~EOS
    HomekitConnector is a macOS menubar app for HomeKit control.
    The app is properly notarized with Apple, so you can open it directly.
  EOS
end
