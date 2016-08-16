class Goenv < Formula
  desc "Golang Version Management"
  homepage "https://github.com/kaneshin/goenv"
  url "https://github.com/kaneshin/goenv/archive/v0.4.0.tar.gz"
  sha256 "39a6709018520c140ac574092857e487cbc884bd1f95bc04b2eec22e99a9fd28"
  head "https://github.com/kaneshin/goenv.git"
  version "0.4.0"

  def install
    prefix.install Dir["*"]
  end

  def caveats; <<-EOS.undent
    In order to use this build of goenv as your interactive shell,
    it must be added the following lines to your profile:
      export GOENV_ROOT=#{opt_prefix}
      export PATH="$GOENV_ROOT/bin:$PATH"

    And also add the following lines to enable shims:
      which goenv > /dev/null && eval "$(goenv init -)"
    EOS
  end

  test do
    shell_output("eval \"$(#{bin}/goenv init -)\" && goenv versions")
  end
end
