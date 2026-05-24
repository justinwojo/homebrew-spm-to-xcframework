class SpmToXcframework < Formula
  include Language::Python::Shebang

  desc "Convert Swift Package Manager packages into prebuilt XCFrameworks"
  homepage "https://github.com/justinwojo/spm-to-xcframework"
  url "https://github.com/justinwojo/spm-to-xcframework/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "1de241e3a849b963b002cd04c3e46e106e8b02fa9138478524e16e6333c0ee13"
  license "MIT"

  # macOS-only: the tool drives `xcodebuild` to produce .xcframeworks.
  depends_on :macos
  depends_on "python@3.13"

  def install
    bin.install "spm-to-xcframework"
    # Pin the shebang to the keg's Python so the tool never depends on
    # PATH ordering or the (Apple-deprecated) system python3.
    rewrite_shebang detected_python_shebang, bin/"spm-to-xcframework"
  end

  test do
    assert_match "usage: spm-to-xcframework", shell_output("#{bin}/spm-to-xcframework --help")
  end
end
