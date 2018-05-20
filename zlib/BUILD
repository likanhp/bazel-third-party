package(default_visibility = ["//visibility:private"])

load(
    "//tools/build_defs:cc.bzl",
    "INCLUDE_PREFIX",
    "copts_include",
)

cc_library(
    name = "zlib",
    hdrs = [
        "zlib/zconf.h",
        "zlib/zlib.h",
    ],
    include_prefix = INCLUDE_PREFIX,
    visibility = [
        "//visibility:public",
    ],
    deps = [
        ":impl",
    ],
)

cc_library(
    name = "zlib_for_third_party",
    hdrs = [
        "zlib/zconf.h",
        "zlib/zlib.h",
    ],
    includes = [
        "zlib",
    ],
    visibility = [
        "//:__subpackages__",
    ],
    deps = [
        ":impl",
    ],
)

cc_library(
    name = "impl",
    srcs = glob([
        "zlib/*.c",
    ]) + select({
        "@bazel_shared//tools/target_cpu:k8": [
            "zlib/contrib/amd64/amd64-match.S",
        ],
        "@bazel_shared//tools/target_cpu:piii": [
            "zlib/contrib/asm686/match.S",
        ],
        "//conditions:default": [],
    }),
    hdrs = glob([
        "zlib/*.h",
    ]),
    copts = [
        "-Wno-implicit-function-declaration",
    ] + copts_include("zlib/zlib") + select({
        "@bazel_shared//tools/target_cpu:k8": [
            "-DUNALIGNED_OK",
            "-DEXPAND_INSERT_STRING",
        ],
        "@bazel_shared//tools/target_cpu:piii": [
            "-DASMV",
            "-DNO_UNDERLINE",
        ],
        "//conditions:default": [],
    }),
)

[
    cc_binary(
        name = name,
        srcs = [
            "zlib/test/%s.c" % name,
        ],
        visibility = [
            "//visibility:private",
        ],
        deps = [
            ":zlib_for_third_party",
        ],
    )
    for name in ("minigzip", "example")
]

genrule(
    name = "test_minigzip",
    srcs = [],
    outs = [
        "test_minigzip_in.txt",
        "test_minigzip_out.txt",
    ],
    cmd = "echo 'Hello, world!' > $(location test_minigzip_in.txt) && " +
          "$(location :minigzip) < $(location test_minigzip_in.txt) | " +
          "$(location :minigzip) -d > $(location test_minigzip_out.txt) && " +
          "cmp $(location test_minigzip_in.txt) $(location test_minigzip_out.txt)",
    tools = [
        ":minigzip",
    ],
)

genrule(
    name = "test_example",
    srcs = [],
    outs = [
        "test_example_out.txt",
    ],
    cmd = "$(location :example) > $@",
    tools = [
        ":example",
    ],
)
