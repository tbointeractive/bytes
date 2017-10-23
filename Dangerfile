# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
declared_trivial = github.pr_title.include? "#trivial"
has_pod_changes = !git.modified_files.grep(/Classes/).empty?

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"

# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 500

has_changelog = git.modified_files.include?("CHANGELOG.md")
if has_pod_changes && !has_changelog && !declared_trivial
  fail("Any changes to the cocoapod neet a summary in the changelog.")
end
