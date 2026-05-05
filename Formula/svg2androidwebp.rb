class Svg2androidwebp < Formula
  desc "Convert SVG files to Android WebP density variants"
  homepage "https://github.com/ThibaultCharr/svg2androidwebp"
  url "https://github.com/ThibaultCharr/svg2androidwebp/archive/refs/tags/v1.7.0.tar.gz"
  sha256 "f61098f0072d8449121b512c1a2a397d4db151921500668b652d3033c9d71ead"
  license "MIT"

  depends_on "librsvg"
  depends_on "webp"

  def install
    libexec.install "converter.py"

    (bin/"svg2androidwebp").write <<~EOS
      #!/bin/bash
      exec /usr/bin/python3 "#{libexec}/converter.py" "$@"
    EOS
  end

  test do
    system "#{bin}/svg2androidwebp", "--help"
  end
end
