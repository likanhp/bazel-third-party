cc_inc_library(
    name = "zlib",
    hdrs = [
        "zlib/zconf.h",
        "zlib/zlib.h",
    ],
    prefix = "zlib",
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
        "-Izlib/zlib",
    ] + select({
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
    visibility = [
        "//visibility:private",
    ],
)
