class Nagobot < Formula
  desc "AI bot framework with multi-channel support"
  homepage "https://github.com/linanwx/nagobot"
  url "https://github.com/linanwx/nagobot.git",
      tag:      "v0.1.3",
      revision: "9f774f6a6feff8714ba2cec7372d64d70b6693ce"
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
