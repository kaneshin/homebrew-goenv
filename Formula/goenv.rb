class Goenv < Formula
  desc "Golang Version Management"
  homepage "https://github.com/kaneshin/goenv"
  url "https://github.com/kaneshin/goenv/archive/v0.4.5.tar.gz"
  sha256 "7cfdeb9c1ec69dd345ced44f54fa40c7ead230994c5dc98bbe95077d1331d973"
  head "https://github.com/kaneshin/goenv.git"
  version "0.4.5"

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
