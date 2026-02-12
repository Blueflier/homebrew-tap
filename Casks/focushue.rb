cask "focushue" do
  version "1.2.1"
  sha256 "47adbce908d127bf9ecdb0883ebe57beda1a08da4877abcfb93016fed7bea914"

  url "https://github.com/Blueflier/FocusHue/releases/download/v#{version}/FocusHue.dmg"
  name "FocusHue"
  desc "Automated greyscale for deep work focus"
  homepage "https://github.com/Blueflier/FocusHue"

  app "FocusHue.app"

  zap trash: [
      "~/Library/Application Support/FocusHue",
      "~/Library/Preferences/jio.osephhartono.FocusHue.FocusHue.plist",
  ]

  # This section appears in the terminal after the user installs
  caveats <<~EOS
    FocusHue requires Accessibility permissions to monitor your active apps 
    and automate greyscale triggers.

    After opening the app, please go to:
    System Settings > Privacy & Security > Accessibility
    and ensure 'FocusHue' is toggled ON.
  EOS
end
