cask "focushue" do
  version "1.0.0"
  sha256 "PASTE_YOUR_SHA256_STRING_HERE"

  url "https://github.com/josephhartono/FocusHue/releases/download/v#{version}/FocusHue.dmg"
  name "FocusHue"
  desc "Automated greyscale for deep work focus"
  homepage "https://github.com/josephhartono/FocusHue"

  app "FocusHue.app"

  zap trash: [
    "~/Library/Application Support/FocusHue",
    "~/Library/Preferences/com.josephhartono.FocusHue.plist",
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
