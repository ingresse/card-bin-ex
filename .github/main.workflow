workflow "Branch Build" {
  on = "push"
  resolves = [
    "Test"
  ]
}

action "Filter Branch" {
  uses = "actions/bin/filter@b2bea0749eed6beb495a8fa194c071847af60ea1"
  args = "branch"
}

action "Lint" {
  uses = "ingresse/gh-actions/elixir/mix@master"
  args = "format --check-formatted"
  needs = ["Filter Branch"]
}

action "Deps" {
  uses = "ingresse/gh-actions/elixir/mix@master"
  args = "deps.get"
  needs = ["Filter Branch"]
}

action "Test" {
  uses = "ingresse/gh-actions/elixir/mix@master"
  args = "test"
  needs = ["Deps"]
}
