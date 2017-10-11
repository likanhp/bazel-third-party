py_library(
    name = "gflags",
    srcs = glob([
        "gflags/gflags/**/*.py",
    ], exclude = [
        "gflags/gflags/**/*_test.py",
    ]),
    imports = [
        "gflags",
    ],
    visibility = [
        "//visibility:public",
    ],
    deps = [
        "//py/six",
    ],
)
