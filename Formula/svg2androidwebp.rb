class Svg2androidwebp < Formula
  desc "Convert SVG files to Android WebP density variants"
  homepage "https://github.com/ThibaultCharr/svg2androidwebp"
  url "https://github.com/ThibaultCharr/svg2androidwebp/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "e113d1a4d581d9b4a5022f7c98ed01ccf2df5e24b705dd4630d4aec9df894561"
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
