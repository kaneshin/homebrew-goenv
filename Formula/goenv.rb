class Goenv < Formula
  desc "Golang Version Management"
  homepage "https://github.com/kaneshin/goenv"
  url "https://github.com/kaneshin/goenv/archive/v0.4.3.tar.gz"
  sha256 "0815fe6add5a5a2d2350e8b3446ab990c8fb54d26cbbd38308c083d61707500f"
  head "https://github.com/kaneshin/goenv.git"
  version "0.4.3"

  def install
    prefix.install Dir["*"]
  end

  def caveats; <<-EOS.undent
    goenv stores data under ~/.goenv by default. If you absolutely need to
    store everything under Homebrew's prefix, include this in your profile:
      export GOENV_ROOT=#{var}/goenv
      export PATH="$GOENV_ROOT/bin:$PATH"

    To enable shims and autocompletion add the following line to your profile:
      which goenv > /dev/null && eval "$(goenv init -)"
    EOS
  end

  test do
    shell_output("eval \"$(#{bin}/goenv init -)\" && goenv versions")
  end
end
