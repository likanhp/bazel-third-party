package(default_visibility = ["//visibility:private"])

load("//tools/build_defs:cc.bzl", "INCLUDE_PREFIX")

cc_library(
    name = "libbz2",
    hdrs = [
        "bzip2/bzlib.h",
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
    name = "libbz2_for_third_party",
    hdrs = [
        "bzip2/bzlib.h",
    ],
    includes = [
        "bzip2",
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
    srcs = [
        "bzip2/blocksort.c",
        "bzip2/bzlib.c",
        "bzip2/bzlib_private.h",
        "bzip2/compress.c",
        "bzip2/crctable.c",
        "bzip2/decompress.c",
        "bzip2/huffman.c",
        "bzip2/randtable.c",
    ],
    hdrs = [
        "bzip2/bzlib.h",
    ],
    visibility = [
        "//visibility:private",
    ],
)

cc_binary(
    name = "bzip2",
    srcs = [
        "bzip2/bzip2.c",
    ],
    deps = [
        ":impl",
    ],
)

cc_binary(
    name = "bzip2recover",
    srcs = [
        "bzip2/bzip2recover.c",
    ],
    deps = [
        ":impl",
    ],
)

genrule(
    name = "test",
    srcs = ["bzip2/sample{0}.{1}".format(i, suffix) for i in range(1, 4) for suffix in ("ref", "bz2")],
    outs = ["bzip2/sample{0}.{1}".format(i, suffix) for i in range(1, 4) for suffix in ("rb2", "tst")],
    cmd = " && ".join(
        ["$(location :bzip2) -{1} <$(location bzip2/sample{0}.{2}) >$(location bzip2/sample{0}.{3})".format(i, o, s, t) for i in range(1, 4) for o, s, t in (
            (i, "ref", "rb2"),
            ("d", "bz2", "tst"),
        )] +
        ["cmp $(location bzip2/sample{0}.{1}) $(location bzip2/sample{0}.{2})".format(i, s, t) for i in range(1, 4) for s, t in (
            ("bz2", "rb2"),
            ("ref", "tst"),
        )],
    ),
    tools = [
        ":bzip2",
    ],
)
