class Nagobot < Formula
  desc "AI bot framework with multi-channel support"
  homepage "https://github.com/linanwx/nagobot"
  url "https://github.com/linanwx/nagobot.git",
      tag:      "v0.1.2",
      revision: "370644365134f8208e7321243bcc3dc6fba57eac"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = "-X github.com/linanwx/nagobot/cmd.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nagobot --version")
  end
end
