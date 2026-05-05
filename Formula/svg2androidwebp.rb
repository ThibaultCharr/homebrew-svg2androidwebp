class Svg2androidwebp < Formula
  desc "Convert SVG files to Android WebP density variants"
  homepage "https://github.com/ThibaultCharr/svg2androidwebp"
  url "https://github.com/ThibaultCharr/svg2androidwebp/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "aafc32a874868e8f28bd5dc636e8e090ed4ec5ab7a45f22c37ea58e8fcd2ff26"
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
