class Mnemo < Formula
  desc "AI conversation indexer — search months of sessions in <1s"
  homepage "https://pilan.ai"
  url "https://github.com/Pilan-AI/mnemo/archive/refs/tags/v1.3.4.tar.gz"
  sha256 "be213cdea668a2968762f90ca0aca4ab4f09ad94e48361dd7a3f8fae4098f0f8"
  license "AGPL-3.0-or-later"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/0xRaghu/mnemo/cmd.Version=#{version}")
  end

  test do
    assert_match "mnemo", shell_output("#{bin}/mnemo version")
  end
end
