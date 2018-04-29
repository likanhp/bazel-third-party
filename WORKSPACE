workspace(name = "bazel_third_party")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "bazel_shared",
    remote = "https://github.com/likanhp/bazel-shared.git",
    tag = "latest",
)

local_repository(
    name = "icu_double_conversion",
    path = "./icu/icu/vendor/double-conversion/upstream",
)
