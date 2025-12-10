class Filius < Formula
  desc "Filius – Lernsoftware für Rechnernetze"
  homepage "https://www.lernsoftware-filius.de"
  url "https://www.lernsoftware-filius.de/downloads/Setup/filius-2.9.4.zip"
  sha256 "22702d82d8b5a3b5af12969662b59e1a6d817d356afb5c04b5eb90fa0a2d6364"
  license "GPL-3.0-or-later"

  depends_on "openjdk@21"

  def install
    libexec.install Dir["*"]
    (bin/"filius").write <<~EOS
      #!/bin/bash
      exec /usr/bin/open -a "#{Formula["openjdk@21"].opt_bin}/java" --args -jar "#{libexec}/filius.jar" "$@"
    EOS
  end

  test do
    true
  end
end
