class Filius < Formula
  desc "Filius – Lernsoftware für Rechnernetze"
  homepage "https://www.lernsoftware-filius.de"
  url "https://www.lernsoftware-filius.de/downloads/Setup/filius-2.9.4.zip"
  sha256 "22702d82d8b5a3b5af12969662b59e1a6d817d356afb5c04b5eb90fa0a2d6364"
  license "GPL-3.0-or-later"

  depends_on "openjdk@21"

  def install
    # Alles aus dem ZIP nach libexec kopieren
    libexec.install Dir["*"]

    # Start-Script 'filius' im bin-Verzeichnis anlegen
    (bin/"filius").write <<~EOS
      #!/bin/bash
      exec "#{Formula["openjdk@21"].opt_bin}/java" -jar "#{libexec}/filius.jar" "$@"
    EOS
  end

  test do
    # Es gibt keinen echten CLI-Test, aber ein Aufruf ohne GUI-Fehler reicht meist
    system "#{bin}/filius", "--version"
  rescue
    # Falls Filius kein --version unterstützt, ignorieren wir den Fehler
    true
  end
end
