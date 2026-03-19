cask "ccsession" do
  arch arm: "aarch64", intel: "x64"

  version "2.0.0"
  sha256 arm:   "1f63061478ddbc9ea6199f8c7ac5504c0a00a9dede783d8495a0758b32e57f2b",
         intel: "2a6a41c9b8621ac159a2efe19c1eb84f6b37dc5b972cd4c36be0780103eb05ed"

  url "https://github.com/JensenRay/CCSession/releases/download/v#{version}/CCSession_#{version}_#{arch}.dmg"
  name "CCSession"
  desc "Desktop app for cleaning local Codex sessions"
  homepage "https://github.com/JensenRay/CCSession"

  depends_on macos: ">= :catalina"

  app "CCSession.app"

  zap trash: [
    "~/Library/Caches/io.toys.ccsession",
    "~/Library/WebKit/io.toys.ccsession",
  ]

  caveats <<~EOS
    If macOS blocks CCSession because the app is unsigned, run:

      xattr -dr com.apple.quarantine /Applications/CCSession.app
  EOS
end
