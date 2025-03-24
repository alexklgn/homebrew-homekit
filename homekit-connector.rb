class HomekitConnector < Formula
  desc "HomekitConnector - A macOS menubar app for HomeKit control"
  homepage "https://github.com/alexklgn/HomekitConnector"
  url "https://github.com/alexklgn/homebrew-homekit/raw/main/HomekitConnector.dmg"
  sha256 "1a2bc7a8ce42724f2049ba9cf744a1889f1206b5dc22adc88f49189000186a6d"
  version "1.0.0"
  
  def install
    # Mount the DMG
    mount_point = `/usr/bin/mktemp -d /tmp/homebrew-homekit-connector.XXXXXX`.chomp
    system "/usr/bin/hdiutil", "attach", "-mountpoint", mount_point, "-nobrowse", "#{staged_path}/HomekitConnector.dmg"
    
    # Copy the app to the Applications directory
    prefix.install Dir["#{mount_point}/*.app"]
    
    # Unmount the DMG
    system "/usr/bin/hdiutil", "detach", mount_point
  end

  def caveats
    <<~EOS
      HomekitConnector has been installed at:
        #{prefix}
      
      The app is properly notarized with Apple, so you can open it directly.
    EOS
  end
end
