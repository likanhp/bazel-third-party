load("@bazel_shared//tools/target_cpu:groups.bzl", "apple")
load("//tools/autoconf:autoconf.bzl", "autoconf")

cc_inc_library(
    name = "liblzma",
    hdrs = glob([
        "xz/src/liblzma/api/**/*.h",
    ]),
    prefix = "xz/src/liblzma/api",
    visibility = [
        "//visibility:public",
    ],
    deps = [
        ":impl",
    ],
)

cc_library(
    name = "liblzma_for_third_party",
    hdrs = [
        "xz/src/liblzma/api/lzma.h",
    ],
    includes = [
        "xz/src/liblzma/api",
    ],
    visibility = [
        "//:__subpackages__",
    ],
    deps = [
        ":impl",
    ],
)

autoconf(
    name = "generate_config_h",
    out = "config.h",
    template = "config.h.in",
    vars = [
        "//tools/autoconf:cc_common",
    ],
)

cc_library(
    name = "impl",
    srcs = [
        "config.h",
    ] + glob(
        [
            "xz/src/common/*.c",
            "xz/src/liblzma/**/*.c",
            "xz/src/liblzma/**/*.h",
        ],
        exclude = [
            "xz/src/liblzma/api/**/*.h",
            "xz/src/liblzma/check/sha256.c",
            "xz/src/liblzma/check/*_fast.c",
            "xz/src/liblzma/check/*_small.c",
            "xz/src/liblzma/**/*_tablegen.c",
        ],
    ) + select({
        "@bazel_shared//tools/target_cpu:piii": glob([
            "xz/src/liblzma/check/*_x86.S",
        ]),
        "//conditions:default": glob([
            "xz/src/liblzma/check/*_fast.c",
        ]),
    }) + select(
        apple([]) + {
            "//conditions:default": [
                "xz/src/liblzma/check/sha256.c",
            ],
        },
    ),
    hdrs = glob([
        "xz/src/common/*.h",
        "xz/src/liblzma/api/**/*.h",
    ]),
    copts = [
        "-std=c99",
        "-DHAVE_CONFIG_H",
        "-isystem",
        "$(GENDIR)/xz",
        "-Ixz/xz/src/common",
        "-Ixz/xz/src/liblzma/api",
        "-Ixz/xz/src/liblzma/check",
        "-Ixz/xz/src/liblzma/common",
        "-Ixz/xz/src/liblzma/delta",
        "-Ixz/xz/src/liblzma/lz",
        "-Ixz/xz/src/liblzma/lzma",
        "-Ixz/xz/src/liblzma/rangecoder",
        "-Ixz/xz/src/liblzma/simple",
    ],
    visibility = [
        "//visibility:private",
    ],
)
