package(default_visibility = ["//visibility:private"])

load(
    ":build_defs.bzl",
    "COMMON_COPTS",
    "icu_cc_library",
)
load(
    "//tools/build_defs:cc.bzl",
    "INCLUDE_PREFIX",
    "copts_include",
)
load(
    "@bazel_shared//tools/target_cpu:groups.bzl",
    "big_endian",
    "linux",
    "little_endian",
)

DATA_TYPE_CONFIG = big_endian("b") + little_endian("l")

cc_library(
    name = "unicode",
    hdrs = glob([
        "icu/icu4c/source/common/unicode/*.h",
    ]),
    copts = COMMON_COPTS,
    strip_include_prefix = "icu/icu4c/source/common",
)

cc_library(
    name = "data_stub",
    srcs = [
        "icu/icu4c/source/stubdata/stubdata.cpp",
    ],
    copts = COMMON_COPTS,
    deps = [
        ":unicode",
    ],
)

cc_library(
    name = "data_impl",
    deps = select({k: [":data_%s" % v] for k, v in DATA_TYPE_CONFIG.items()}),
)

icu_cc_library(
    name = "common",
    srcs = glob([
        "icu/icu4c/source/common/*.cpp",
    ]),
    hdrs = glob([
        "icu/icu4c/source/common/*.h",
    ]),
    deps = [
        ":data",
        ":unicode",
    ],
)

icu_cc_library(
    name = "i18n",
    srcs = glob([
        "icu/icu4c/source/i18n/*.cpp",
    ]),
    hdrs = glob([
        "icu/icu4c/source/i18n/*.h",
        "icu/icu4c/source/i18n/unicode/*.h",
    ]),
    deps = [
        ":common",
        ":unicode",
    ],
)

icu_cc_library(
    name = "io",
    srcs = glob([
        "icu/icu4c/source/io/*.cpp",
    ]),
    hdrs = glob([
        "icu/icu4c/source/io/*.h",
        "icu/icu4c/source/io/unicode/*.h",
    ]),
    deps = [
        ":common",
        ":i18n",
        ":unicode",
    ],
)

icu_cc_library(
    name = "toolutil",
    srcs = glob([
        "icu/icu4c/source/tools/toolutil/*.cpp",
    ]),
    hdrs = glob([
        "icu/icu4c/source/tools/toolutil/*.h",
    ]),
    linkopts = select(linux([
        "-ldl",
    ]) + {
        "//conditions:default": [],
    }),
    deps = [
        ":common",
        ":i18n",
        ":unicode",
    ],
)

cc_binary(
    name = "validate_data_type",
    srcs = [
        "validate_data_type.cc",
    ],
    copts = COMMON_COPTS,
    deps = [
        "unicode",
    ],
)

genrule(
    name = "validate_data_type_gen",
    srcs = [],
    outs = [
        "_validate_data_type_dummy",
    ],
    cmd = "$(location :validate_data_type) " + select(DATA_TYPE_CONFIG) + " > $@",
    tools = [
        ":validate_data_type",
    ],
)

cc_binary(
    name = "generate_data_library",
    srcs = [
        "generate_data_library.cc",
    ],
    copts = COMMON_COPTS,
    deps = [
        ":unicode",
    ],
)

cc_binary(
    name = "icupkg",
    srcs = [
        "icu/icu4c/source/tools/icupkg/icupkg.cpp",
    ],
    copts = COMMON_COPTS + copts_include(
        "icu/icu/icu4c/source/common",
    ) + copts_include(
        "icu/icu/icu4c/source/tools/toolutil",
    ),
    deps = [
        ":common_stub",
        ":toolutil_stub",
        ":unicode",
    ],
)

[
    genrule(
        name = "gen_data_" + data_type,
        srcs = [
            "gen/data_l.dat",
        ],
        outs = [
            "gen/data_" + data_type + ".dat",
        ],
        cmd = "$(location :icupkg) --auto_toc_prefix_with_type  -t" + select(DATA_TYPE_CONFIG) + " $< $@",
        tools = [
            ":icupkg",
        ],
    )
    for data_type in ("b", "e")
]

[
    (
        genrule(
            name = "gen_data_lib_cc_" + data_type,
            srcs = [
                "gen/data_" + data_type + ".dat",
            ],
            outs = [
                "gen/data_" + data_type + ".cc",
            ],
            cmd = "$(location :generate_data_library) <$< >$@",
            tools = [
                ":generate_data_library",
            ],
        ),
        cc_library(
            name = "data_" + data_type,
            srcs = [
                "gen/data_" + data_type + ".cc",
            ],
        ),
    )
    for data_type in [
        "l",
        "b",
        "e",
    ]
]

[
    [
        cc_library(
            name = "%s_for_third_party" % name,
            hdrs = glob([
                "icu/icu4c/source/%s/unicode/*.h" % name,
            ]),
            includes = [
                "icu/icu4c/source/%s" % name,
            ],
            visibility = [
                "//:__subpackages__",
            ],
            deps = [
                ":%s_impl" % name,
            ],
        ),
        cc_library(
            name = name,
            hdrs = glob([
                "icu/icu4c/source/%s/unicode/*.h" % name,
            ]),
            include_prefix = INCLUDE_PREFIX + "/icu",
            includes = [
                "icu/icu4c/source/%s" % name,
            ],
            strip_include_prefix = "icu/icu4c/source/%s/unicode" % name,
            visibility = [
                "//visibility:public",
            ],
            deps = [
                ":%s_impl" % name,
            ],
        ),
    ]
    for name in [
        "common",
        "i18n",
        "io",
    ]
]
