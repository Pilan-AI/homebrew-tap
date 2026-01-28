class HermesLang < Formula
  desc "Cultural programming language that transpiles to Python"
  homepage "https://pilan.ai"
  url "https://github.com/Pilan-AI/hermes-lang/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "b67b6f6b2689add6b417767352bab62acce69741a0b972f55e06812d449a198f"
  license "AGPL-3.0-or-later"

  depends_on "python@3.12"

  def install
    system "python3.12", "-m", "pip", "install", "--prefix=#{prefix}", "--no-deps", "."
  end

  test do
    assert_match "hermes", shell_output("#{bin}/hermes --version 2>&1", 0)
  end
end
