class Svg2androidwebp < Formula
  desc "Convert SVG files to Android WebP density variants"
  homepage "https://github.com/ThibaultCharr/svg2androidwebp"
  url "https://github.com/ThibaultCharr/svg2androidwebp/archive/refs/tags/v1.6.0.tar.gz"
  sha256 "aafc32a874868e8f28bd5dc636e8e090ed4ec5ab7a45f22c37ea58e8fcd2ff26"
  license "MIT"

  depends_on "python@3.12"
  depends_on "libffi"
  depends_on "cairo"

  resource "cairosvg" do
    url "https://files.pythonhosted.org/packages/source/c/cairosvg/cairosvg-2.7.1.tar.gz"
    sha256 "432531d72f9f73e1f53ca55b98f2a1be68af2e7a547bc7ac09e5dd9ff29a53af"
  end

  resource "Pillow" do
    url "https://files.pythonhosted.org/packages/source/p/pillow/pillow-10.4.0.tar.gz"
    sha256 "166c1cd4d24309b30d61f79f4a9114b7b2313d7450a3df4beaf4de34b2ee0f7b"
  end

  resource "cssselect2" do
    url "https://files.pythonhosted.org/packages/source/c/cssselect2/cssselect2-0.7.0.tar.gz"
    sha256 "1ccd984dab89fc68955043aca4e1b03e0cf29cad9880f6e28e3ba7a74b14aa5a"
  end

  resource "tinycss2" do
    url "https://files.pythonhosted.org/packages/source/t/tinycss2/tinycss2-1.3.0.tar.gz"
    sha256 "152f9acabd296a8375fbca5b84c961ff95971fcfc543d14e43dc61b37c3a2e6e"
  end

  resource "defusedxml" do
    url "https://files.pythonhosted.org/packages/source/d/defusedxml/defusedxml-0.7.1.tar.gz"
    sha256 "1bb3032db185915b62d7c6209c5a8792be6a32ab2fedacc84e01b52c51aa3e69"
  end

  resource "webencodings" do
    url "https://files.pythonhosted.org/packages/source/w/webencodings/webencodings-0.5.1.tar.gz"
    sha256 "b36a1c245f2d304965eb4e0a82848379241dc04b865afcc4aab16748587e1923"
  end

  def install
    venv = virtualenv_create(libexec, "python3.12")
    resources.each do |r|
      r.stage { venv.pip_install_and_link r }
    end

    libexec.install "converter.py"

    (bin/"svg2androidwebp").write <<~EOS
      #!/bin/bash
      exec "#{libexec}/bin/python3" "#{libexec}/converter.py" "$@"
    EOS
  end

  test do
    system "#{bin}/svg2androidwebp", "--help"
  end
end
