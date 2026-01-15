class Declutter < Formula
  desc "Declutter web pages and turn them into archival documents"
  homepage "https://github.com/subranag/declutter"
  version "latest"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/subranag/declutter/releases/download/vlatest/declutter-macos-x64.tar.gz"
      sha256 "cd19f15b8c12722ce09a62c51e6c4825f7ec42b22a699565f34f8466951a5315"
    elsif Hardware::CPU.arm?
      url "https://github.com/subranag/declutter/releases/download/vlatest/declutter-macos-arm64.tar.gz"
      sha256 "0f3fc9456b8b1bc5e3cef0dc95d5f43aa8c8bff93a37271ae6741c533f4aebbb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/subranag/declutter/releases/download/vlatest/declutter-linux-x64.tar.gz"
      sha256 "07b1dc48adc52e96ca83442a8e5db064f53f544d5b584a06885139be7b8d2f03"
    elsif Hardware::CPU.arm?
      url "https://github.com/subranag/declutter/releases/download/vlatest/declutter-linux-arm64.tar.gz"
      sha256 "2d20decdff615077a27a8e99be076cb88db67d134c829cb6543d60817af14942"
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