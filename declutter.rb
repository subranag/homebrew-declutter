class Declutter < Formula
  desc "Declutter web pages and turn them into archival documents"
  homepage "https://github.com/subranag/declutter"
  version "0.0.2"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/subranag/declutter/releases/download/v0.0.2/declutter-macos-x64.tar.gz"
      sha256 "be51deac7117763bfe6ded15a973d7f6f5a478598f956cbfcd3eef6e4fcab409"
    elsif Hardware::CPU.arm?
      url "https://github.com/subranag/declutter/releases/download/v0.0.2/declutter-macos-arm64.tar.gz"
      sha256 "157482d4f9a57f56b7f7f18a6034dc976be6d50b5b7a79c8e0ac4141e5cf1056"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/subranag/declutter/releases/download/v0.0.2/declutter-linux-x64.tar.gz"
      sha256 "3c55715ee56430aeff51918058c954d50e626f7d07317beef6bcf788ec4c6aae"
    elsif Hardware::CPU.arm?
      url "https://github.com/subranag/declutter/releases/download/v0.0.2/declutter-linux-arm64.tar.gz"
      sha256 "900432c61ad735eefc8c1a6dbf3081418529b68b3ac92dcd30efd5c756fc3992"
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