# frozen_string_literal: true
Spring.application_root = "test/demo"
Spring.watch(
  ".ruby-version",
  ".rbenv-vars",
  "tmp/restart.txt",
  "tmp/caching-dev.txt"
)
