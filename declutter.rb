class Declutter < Formula
  desc "Declutter web pages and turn them into archival documents"
  homepage "https://github.com/subranag/declutter"
  version "0.0.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/subranag/declutter/releases/download/v0.0.1/declutter-macos-x64.tar.gz"
      sha256 "1f2ea919e1d589f949136ef2582c0e4ab1fe51a632d268f0d54e56c7f2cb9243"
    elsif Hardware::CPU.arm?
      url "https://github.com/subranag/declutter/releases/download/v0.0.1/declutter-macos-arm64.tar.gz"
      sha256 "6c67384507048c39f3e674d419abfd7f17ce071a25d9759b5c9761f7abed9876"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/subranag/declutter/releases/download/v0.0.1/declutter-linux-x64.tar.gz"
      sha256 "5eff798dd0b1e376cb232c11d9409330fffc71de334d6ef81d9c937f298f423d"
    elsif Hardware::CPU.arm?
      url "https://github.com/subranag/declutter/releases/download/v0.0.1/declutter-linux-arm64.tar.gz"
      sha256 "38e6d962d00da3db189f37155039e2e90c570c3eeffb2e3d5b7dd4d55c130bee"
    end
  end

  def install
    bin.install "declutter-macos-x64" => "declutter" if OS.mac? && Hardware::CPU.intel?
    bin.install "declutter-macos-arm64" => "declutter" if OS.mac? && Hardware::CPU.arm?
    bin.install "declutter-linux-x64" => "declutter" if OS.linux? && Hardware::CPU.intel?
    bin.install "declutter-linux-arm64" => "declutter" if OS.linux? && Hardware::CPU.arm?
    
    # Remove quarantine attribute on macOS
    system "xattr", "-cr", "#{bin}/declutter" if OS.mac?
  end
end