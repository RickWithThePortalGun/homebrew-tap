# Homebrew formula for ani-gui.
#
# This file lives in two repos:
#   rickwiththeportalgun/ani-gui           — source of truth, edited here
#   rickwiththeportalgun/homebrew-tap      — the published copy Brew reads
#
# After updating, copy to the tap repo and push both.
class AniGui < Formula
  include Language::Python::Virtualenv

  desc "Small local web UI for ani-cli"
  homepage "https://github.com/rickwiththeportalgun/ani-gui"
  url "https://github.com/rickwiththeportalgun/ani-gui/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "9e9f8c876dce9de15a87303467c499ccd45b7b791c3372333fa43fc828666b89"
  license "GPL-3.0-or-later"

  depends_on "python@3.12"
  depends_on "mpv"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      ani-gui requires ani-cli for playback.  Install it from the upstream
      repo if you haven't already:

        curl -sL https://raw.githubusercontent.com/pystardust/ani-cli/master/ani-cli -o /usr/local/bin/ani-cli
        chmod +x /usr/local/bin/ani-cli

      Then run:
        ani-gui
    EOS
  end

  test do
    assert_match "ani-gui", shell_output("#{bin}/ani-gui --version")
  end
end
