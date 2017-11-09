load(
    "@bazel_shared//tools/target_cpu:groups.bzl",
    "apple",
    "linux",
)
load("//tools/build_defs:cc.bzl", "copts_include")

COMMON_COPTS = [
    "-DU_ATTRIBUTE_DEPRECATED=",
    "-DU_HAVE_ATOMIC=1",
    "-DU_HAVE_STRTOD_L=1",
    "-DUNISTR_FROM_CHAR_EXPLICIT=explicit",
    "-DUNISTR_FROM_STRING_EXPLICIT=explicit",
    "-D_REENTRANT",
    "-fdata-sections",
    "-ffunction-sections",
] + select(linux([
    "-DU_HAVE_ELF_H=1",
]) + apple([
    "-DU_HAVE_XLOCALE_H=1",
]) + {
    "//conditions:default": [],
})

_STUB_DEPS = [
    ":common",
    ":data",
    ":i18n",
    ":io",
    ":toolutil",
]

def icu_cc_library(name, srcs, hdrs, deps, **kwargs):
    copts = [
        "-DU_%s_IMPLEMENTATION" % name.upper(),
    ] + copts_include("icu/icu/icu4c/source/%s" % name)
    for dep in deps:
        if dep in _STUB_DEPS:
            copts.extend(copts_include("icu/icu/icu4c/source/%s" % dep[1:]))
    copts = COMMON_COPTS + copts

    native.cc_library(
        name = name + "_stub",
        srcs = srcs,
        hdrs = hdrs,
        copts = copts,
        deps = [dep + "_stub" if dep in _STUB_DEPS else dep for dep in deps],
        **kwargs
    )
    native.cc_library(
        name = name + "_impl",
        srcs = srcs + hdrs,
        copts = copts,
        deps = [dep + "_impl" if dep in _STUB_DEPS else dep for dep in deps],
        **kwargs
    )
