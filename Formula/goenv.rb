class Goenv < Formula
  desc "Golang Version Management"
  homepage "https://github.com/kaneshin/goenv"
  url "https://github.com/kaneshin/goenv/archive/v0.4.2.tar.gz"
  sha256 "92995d6bc24ab07c6626d311d485c60b5b1ffbf71c1bf874779f86761e2a7bb7"
  head "https://github.com/kaneshin/goenv.git"
  version "0.4.2"

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
