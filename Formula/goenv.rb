class Goenv < Formula
  desc "Golang Version Management"
  homepage "https://github.com/kaneshin/goenv"
  url "https://github.com/kaneshin/goenv/archive/0.3.0.tar.gz"
  sha256 "2e8134ed0e55b791a665601c340f268e0011f165f28a126714c4f4ada47e053b"
  head "https://github.com/kaneshin/goenv.git"
  version "0.3.0"

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
