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

# TODO(likan): switch to official version when https://github.com/bazelbuild/rules_go/pull/1558
# has been merged and released.
http_archive(
    name = "io_bazel_rules_go",
    sha256 = "97ea17397992eda0c92db8cc899a88cc3242ff09149cde7374d529de7f6e4086",
    strip_prefix = "rules_go-4bef9397c4b7db177235f0fda55d129747e14a34",
    url = "https://github.com/likan999/rules_go/archive/4bef9397c4b7db177235f0fda55d129747e14a34.tar.gz",
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
