cask "focushue" do
  version "1.1.8"
  sha256 "fa9591ec7db9de4caead26c4919ac08c899a9bc2169afce89ff32bccfda0862a"

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
