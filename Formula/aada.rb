class Aada < Formula
  desc "Accenture Active Directory Authenticator (AWS credential_process helper)"
  homepage "https://github.com/Accenture/aada"
  version "1.3.6"

  # NOTE: Update the url and sha256 to match the macOS ARM64 artifact when you cut a new release.
  # The build system produces separate ZIPs per platform, named like:
  #   aada_mac_arm64.zip, aada_mac_x64.zip, aada_win_x64.zip, ...
  # Prefer arm64 for Apple Silicon. If you need Intel, change to aada_mac_x64.zip and sha256.
  on_arm do
    url "https://github.com/Accenture/aada/releases/download/v#{version}/aada_mac_arm64.zip", using: :nounzip
    sha256 "0dbd94ababb696acd012bd6aa3ba137392b0b6ec27a3da51d86807aaa96424e2"
  end

  on_intel do
    url "https://github.com/Accenture/aada/releases/download/v#{version}/aada_mac_x64.zip", using: :nounzip
    sha256 "865a7efe1276bda3456cf1a2945e03084b015a0c5b8556daef54f46fc15d01d1"
  end

  depends_on :macos

  def install
    # The ZIP produced by releases contains a single file (binary) named "aada_mac_*" for mac
    # The repo's signing step re-zips into <binary>.zip. We fetch the zip and just extract the binary.
    ohai "Extracting binary from zip"
    safe_system "unzip", "-p", cached_download, "aada", out: "aada"
    bin.install "aada"
  end

  test do
    # Verify the binary is callable and prints usage or version without network calls
    output = shell_output("#{bin}/aada -h", 2)
    assert_match "aada", output
  end

  def caveats
    <<~EOS
      After installation, configure your AWS profiles by running:
        aada -configure

      Then use your profiles as normal, e.g.:
        aws --profile <your-profile> sts get-caller-identity

      For details, see: https://github.com/Accenture/aada
    EOS
  end
end
