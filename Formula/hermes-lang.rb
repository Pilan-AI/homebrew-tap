class HermesLang < Formula
  desc "Cultural programming language that transpiles to Python"
  homepage "https://pilan.ai"
  url "https://github.com/Pilan-AI/hermes-lang/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b67b6f6b2689add6b417767352bab62acce69741a0b972f55e06812d449a198f"
  license "AGPL-3.0-or-later"

  depends_on "python@3.12"

  def install
    # Install the hermes package into libexec
    libexec.install Dir["hermes"]
    libexec.install "pyproject.toml"
    libexec.install Dir["examples"]

    # Create wrapper script
    (bin/"hermes").write <<~SH
      #!/bin/bash
      PYTHONPATH="#{libexec}" exec "#{Formula["python@3.12"].opt_bin}/python3.12" -m hermes "$@"
    SH
  end

  test do
    assert_match "hermes", shell_output("#{bin}/hermes --help 2>&1")
  end
end
