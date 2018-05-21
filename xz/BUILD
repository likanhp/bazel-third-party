package(default_visibility = ["//visibility:private"])

load("@bazel_shared//tools/autoconf:autoconf.bzl", "autoconf")
load("@bazel_shared//tools/build_defs:file.bzl", "basename")
load("@bazel_shared//tools/target_cpu:groups.bzl", "apple")
load(
    "//tools/build_defs:cc.bzl",
    "INCLUDE_PREFIX",
    "copts_include",
)

cc_library(
    name = "liblzma",
    hdrs = glob([
        "xz/src/liblzma/api/**/*.h",
    ]),
    include_prefix = INCLUDE_PREFIX + "/xz",
    strip_include_prefix = "xz/src/liblzma/api",
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
] + copts_include(
    "xz",
    gendir = True,
    system = True,
) + copts_include("xz/xz/src/common") + copts_include("xz/xz/src/liblzma/api")

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
    visibility = [
        "//visibility:public",
    ],
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
    visibility = [
        "//visibility:public",
    ],
    deps = [
        ":impl",
    ],
)

[
    cc_binary(
        name = name,
        srcs = [
            "xz/src/common/tuklib_exit.c",
            "xz/src/common/tuklib_exit.h",
            "xz/src/common/tuklib_gettext.h",
            "xz/src/common/tuklib_progname.c",
            "xz/src/common/tuklib_progname.h",
            "xz/src/xzdec/xzdec.c",
        ],
        copts = BINARY_COPTS + opts,
        visibility = [
            "//visibility:public",
        ],
        deps = [
            ":impl",
        ],
    )
    for name, opts in (
        ("xzdec", []),
        (
            "lzmadec",
            ["-DLZMADEC"],
        ),
    )
]

autoconf(
    name = "generate_config_h",
    out = "config.h",
    template = "config.h.in",
    vars = [
        "@bazel_shared//tools/autoconf:cc_common",
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
        copt
        for dir in ("check", "common", "delta", "lz", "lzma", "rangecoder", "simple")
        for copt in copts_include("xz/xz/src/liblzma/%s" % dir)
    ],
    linkopts = select(
        apple([]) + {
            "//conditions:default": [
                "-pthread",
            ],
        },
    ),
)

[
    cc_binary(
        name = basename(file)[:-2],
        srcs = [
            file,
            "xz/tests/tests.h",
        ],
        copts = BINARY_COPTS,
        deps = [
            ":impl",
        ],
    )
    for file in glob([
        "xz/tests/test_*.c",
    ]) + [
        "xz/tests/create_compress_files.c",
    ]
]

[
    genrule(
        name = "test_%s" % name,
        srcs = [],
        outs = [
            "%s_out.txt" % name,
        ],
        cmd = "$(location :%s) > $@" % name,
        tools = [
            ":%s" % name,
        ],
    )
    for file in glob([
        "xz/tests/test_*.c",
    ])
    for name in (basename(file)[:-2],)
]

GOOD_XZ_FILES = glob(["xz/tests/files/good-*.xz"])

BAD_XZ_FILES = glob(["xz/tests/files/bad-*.xz"])

genrule(
    name = "test_files",
    srcs = GOOD_XZ_FILES + BAD_XZ_FILES,
    outs = [
        "test_files_out.txt",
    ],
    cmd = ("{ " +
           " && ".join(["$(location :xz) -dc $(location %s)" % file for file in GOOD_XZ_FILES] +
                       ["$(location :xzdec) $(location %s)" % file for file in GOOD_XZ_FILES] +
                       ["! $(location :xz) -dc $(location %s)" % file for file in BAD_XZ_FILES] +
                       ["! $(location :xzdec) $(location %s)" % file for file in BAD_XZ_FILES]) +
           "; } > $@ 2> /dev/null"),
    tools = [
        ":xz",
        ":xzdec",
    ],
)

PREPARED_COMPRESS_FILES = glob(["xz/tests/compress_prepared_*"])

INPUT_FILES = (["$(location %s)" % file for file in PREPARED_COMPRESS_FILES] +
               ["compress_generated_%s" % file for file in ("abc", "random", "text")])

ARGS = (["-%d" % i for i in range(1, 5)] +
        ["%s --lzma2=dict=64KiB,nice=32,mode=fast" % arg for arg in (
            "--delta=dist=1",
            "--delta=dist=4",
            "--delta=dist=256",
            "--x86",
            "--powerpc",
            "--ia64",
            "--arm",
            "--armthumb",
            "--sparc",
        )])

genrule(
    name = "test_compress",
    srcs = PREPARED_COMPRESS_FILES,
    outs = [
        "test_compress_in.txt",
        "test_compress_out.txt",
    ],
    cmd = ("{ " +
           " && ".join(["$(location :create_compress_files)"] +
                       [
                           " && ".join([
                               "$(location :xz) -c %s %s > $(location test_compress_in.txt)" % (arg, input),
                               "$(location :xz) -cd $(location test_compress_in.txt) > " +
                               "$(location test_compress_out.txt)",
                               "cmp $(location test_compress_out.txt) %s" % input,
                               "$(location :xzdec) $(location test_compress_in.txt) > " +
                               "$(location test_compress_out.txt)",
                               "cmp $(location test_compress_out.txt) %s" % input,
                           ])
                           for arg in ARGS
                           for input in INPUT_FILES
                       ]) +
           "; } >& /dev/null"),
    tools = [
        ":create_compress_files",
        ":xz",
        ":xzdec",
    ],
)

# TODO: add rules generating scripts xzdiff, xzgrep, xzless and xzmore, as well
# as their test cases.
