class HomekitConnector < Formula
  desc "HomekitConnector - A macOS menubar app for HomeKit control"
  homepage "https://github.com/alexklgn/HomekitConnector"
  url "https://github.com/alexklgn/homebrew-homekit/raw/main/HomekitConnector.dmg"
  sha256 "1a2bc7a8ce42724f2049ba9cf744a1889f1206b5dc22adc88f49189000186a6d"
  version "1.0.0"
  
  def install
    # Create a temporary directory for the app
    temp_dir = `/usr/bin/mktemp -d /tmp/homebrew-homekit-app.XXXXXX`.chomp
    
    # Get the DMG path
    dmg_path = cached_download
    
    # Check if the DMG is already mounted and unmount it
    system "/bin/bash", "-c", "for disk in $(/usr/bin/hdiutil info | /usr/bin/grep #{dmg_path} | /usr/bin/awk '{print $1}'); do /usr/bin/hdiutil detach \"$disk\" 2>/dev/null || true; done"
    
    # Mount the DMG
    mount_point = `/usr/bin/mktemp -d /tmp/homebrew-homekit-connector.XXXXXX`.chomp
    system "/usr/bin/hdiutil", "attach", "-mountpoint", mount_point, "-nobrowse", dmg_path
    
    # Copy the app to the temporary directory
    system "/bin/cp", "-R", "#{mount_point}/HomekitConnector.app", temp_dir
    
    # Unmount the DMG
    system "/usr/bin/hdiutil", "detach", mount_point
    
    # Install the app from the temporary directory
    prefix.install "#{temp_dir}/HomekitConnector.app"
    
    # Clean up the temporary directory
    system "/bin/rm", "-rf", temp_dir
  end

  def caveats
    <<~EOS
      HomekitConnector has been installed at:
        #{prefix}
      
      The app is properly notarized with Apple, so you can open it directly.
    EOS
  end
end
