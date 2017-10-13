package(default_visibility = ["//visibility:public"])

py_binary(
    name = "autoconf",
    srcs = [
        "autoconf.py",
    ],
    deps = [
        "//py/glog",
    ],
)

cc_binary(
    name = "cc_common_generator",
    srcs = [
        "cc_common.cc",
    ],
    visibility = [
        "//visibility:private",
    ],
)

genrule(
    name = "generate_cc_common_txt",
    outs = [
        "cc_common",
    ],
    cmd = "$(location :cc_common_generator) > $@",
    tools = [
        ":cc_common_generator",
    ],
)
