cask "svg2androidwebp" do
  version "1.7.0"
  sha256 "dcb79d94559ed85eb31f607a9bd1a599251858fa96a4140b4c6e35633ad4e1eb"

  url "https://github.com/ThibaultCharr/svg2androidwebp/releases/download/v#{version}/SVG2AndroidWebP.zip"
  name "SVG2AndroidWebP"
  desc "Convert SVG files to Android WebP density variants"
  homepage "https://github.com/ThibaultCharr/svg2androidwebp"

  app "SVG2AndroidWebP.app"

  zap trash: [
    "~/Library/Preferences/com.thibaultcharr.svg2androidwebp.json",
  ]
end
