cask "svg2androidwebp" do
  version "1.8.0"
  sha256 "db21502c7b95ef476fb4ef3fe87ca5249521a549d6eed0d681833f81e2d1874f"

  url "https://github.com/ThibaultCharr/svg2androidwebp/releases/download/v#{version}/SVG2AndroidWebP.zip"
  name "SVG2AndroidWebP"
  desc "Convert SVG files to Android WebP density variants"
  homepage "https://github.com/ThibaultCharr/svg2androidwebp"

  app "SVG2AndroidWebP.app"

  zap trash: [
    "~/Library/Preferences/com.thibaultcharr.svg2androidwebp.json",
  ]
end
