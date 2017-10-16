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

BINARY_COPTS = [
    "-std=c99",
    "-DHAVE_CONFIG_H",
    "-isystem",
    "$(GENDIR)/xz",
    "-Ixz/xz/src/common",
    "-Ixz/xz/src/liblzma/api",
]

cc_binary(
    name = "lzmainfo",
    srcs = [
        "xz/src/common/tuklib_exit.c",
        "xz/src/common/tuklib_exit.h",
        "xz/src/common/tuklib_gettext.h",
        "xz/src/common/tuklib_progname.c",
        "xz/src/common/tuklib_progname.h",
        "xz/src/lzmainfo/lzmainfo.c",
    ],
    copts = BINARY_COPTS,
    deps = [
        ":impl",
    ],
)

cc_binary(
    name = "xz",
    srcs = [
        "xz/src/common/tuklib_exit.c",
        "xz/src/common/tuklib_exit.h",
        "xz/src/common/tuklib_gettext.h",
        "xz/src/common/tuklib_mbstr.h",
        "xz/src/common/tuklib_mbstr_fw.c",
        "xz/src/common/tuklib_mbstr_width.c",
        "xz/src/common/tuklib_open_stdxxx.c",
        "xz/src/common/tuklib_open_stdxxx.h",
        "xz/src/common/tuklib_progname.c",
        "xz/src/common/tuklib_progname.h",
    ] + glob([
        "xz/src/xz/*.c",
        "xz/src/xz/*.h",
    ]),
    copts = BINARY_COPTS,
    deps = [
        ":impl",
    ],
)

cc_binary(
    name = "xzdec",
    srcs = [
        "xz/src/common/tuklib_exit.c",
        "xz/src/common/tuklib_exit.h",
        "xz/src/common/tuklib_gettext.h",
        "xz/src/common/tuklib_progname.c",
        "xz/src/common/tuklib_progname.h",
        "xz/src/xzdec/xzdec.c",
    ],
    copts = BINARY_COPTS,
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
        "xz/src/common/tuklib_config.h",
        "xz/src/common/tuklib_cpucores.c",
        "xz/src/common/tuklib_cpucores.h",
        "xz/src/common/tuklib_physmem.c",
        "xz/src/common/tuklib_physmem.h",
    ] + glob(
        [
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
    hdrs = [
        "xz/src/common/mythread.h",
        "xz/src/common/sysdefs.h",
        "xz/src/common/tuklib_common.h",
        "xz/src/common/tuklib_integer.h",
    ] + glob([
        "xz/src/liblzma/api/**/*.h",
    ]),
    copts = BINARY_COPTS + [
        "-Ixz/xz/src/liblzma/check",
        "-Ixz/xz/src/liblzma/common",
        "-Ixz/xz/src/liblzma/delta",
        "-Ixz/xz/src/liblzma/lz",
        "-Ixz/xz/src/liblzma/lzma",
        "-Ixz/xz/src/liblzma/rangecoder",
        "-Ixz/xz/src/liblzma/simple",
    ],
    linkopts = select(
        apple([]) + {
            "//conditions:default": [
                "-pthread",
            ],
        },
    ),
    visibility = [
        "//visibility:private",
    ],
)
