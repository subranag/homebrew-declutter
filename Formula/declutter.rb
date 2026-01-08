class Declutter < Formula
  desc "Declutter web pages and turn them into archival documents"
  homepage "https://github.com/subranag/declutter"
  version "1.0.0"

  def install
      
    # For macOS (Intel)
    if OS.mac? && Hardware::CPU.intel?
        url "https://github.com/subranag/declutter/releases/download/v0.0.1/declutter-macos-x64.tar.gz"
        sha256 "8752caa4f9b0be34723c1aec37bb6f165027974b94cd1fc641a337c34a1a36d1"
        bin.install "declutter-macos-x64" => "declutter"
        # Remove quarantine attribute on macOS
        system "xattr", "-cr", "#{bin}/declutter" if OS.mac?
    end
  
    # For macOS (Apple Silicon)
    if OS.mac? && Hardware::CPU.arm?
        url "https://github.com/subranag/declutter/releases/download/v0.0.1/declutter-macos-arm64.tar.gz"
        sha256 "53c0bac747c3f488aaa71e13c78228df8d2a0fe1a44bebcbe8525acd608ff1dd"
        bin.install "declutter-macos-arm64" => "declutter"
        # Remove quarantine attribute on macOS
        system "xattr", "-cr", "#{bin}/declutter" if OS.mac?
    end
  
    # For Linux
    if OS.linux? && Hardware::CPU.intel?
        url "https://github.com/subranag/declutter/releases/download/v0.0.1/declutter-linux-x64.tar.gz"
        sha256 "df96fdc94f2ae0c3df3f827bea29949d82b3048115377e1084d44a411a56134f"
    end

    if OS.linux? && Hardware::CPU.arm?
        url "https://github.com/subranag/declutter/releases/download/v0.0.1/declutter-linux-arm64.tar.gz"
        sha256 "81d2fa636173613ad496a79858d40d0fd7ba2413610f42612f105635b4b3bb86"
    end

  end
end