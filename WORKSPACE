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

http_archive(
    name = "io_bazel_rules_go",
    sha256 = "c1f52b8789218bb1542ed362c4f7de7052abcf254d865d96fb7ba6d44bc15ee3",
    url = "https://github.com/bazelbuild/rules_go/releases/download/0.12.0/rules_go-0.12.0.tar.gz",
)

http_archive(
    name = "com_github_bazelbuild_buildtools",
    sha256 = "a488c88d4e51c1f3d028f5734a1bd5ae1420eee2bfbc65a30dc6efec23c84cc4",
    strip_prefix = "buildtools-0.12.0",
    url = "https://github.com/bazelbuild/buildtools/archive/0.12.0.tar.gz",
)

load("@io_bazel_rules_go//go:def.bzl", "go_register_toolchains", "go_rules_dependencies")
load("@com_github_bazelbuild_buildtools//buildifier:deps.bzl", "buildifier_dependencies")

go_rules_dependencies()

go_register_toolchains()

buildifier_dependencies()
