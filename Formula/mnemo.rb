class Mnemo < Formula
  desc "AI conversation indexer — search months of sessions in <1s"
  homepage "https://pilan.ai"
  url "https://github.com/Pilan-AI/mnemo/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "1112bd3df6db98383aed2daeeaf93fe5e266bd0996d29a8635eecb7beeb1eb85"
  license "AGPL-3.0-or-later"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/0xRaghu/mnemo/cmd.Version=#{version}")
  end

  test do
    assert_match "mnemo", shell_output("#{bin}/mnemo version")
  end
end
