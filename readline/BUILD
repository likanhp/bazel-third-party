package(default_visibility = ["//visibility:public"])

load("//tools/autoconf:autoconf.bzl", "autoconf")

COPTS = [
    "-DHAVE_CONFIG_H",
    "-DRL_LIBRARY_VERSION='\"7.0\"'",
    "-isystem",
    "readline",
    "-isystem",
    "$(GENDIR)/readline",
]

EXTERNAL_HEADERS = [
    "readline/chardefs.h",
    "readline/history.h",
    "readline/keymaps.h",
    "readline/readline.h",
    "readline/rlconf.h",
    "readline/rlstdc.h",
    "readline/rltypedefs.h",
    "readline/tilde.h",
]

autoconf(
    name = "generate_config_h",
    out = "config.h",
    template = "config.h.in",
    vars = [
        "//tools/autoconf:cc_common",
    ],
)

cc_library(
    name = "readline_impl",
    srcs = glob([
        "readline/*.h",
    ]) + [
        "config.h",
        "readline/bind.c",
        "readline/callback.c",
        "readline/colors.c",
        "readline/compat.c",
        "readline/complete.c",
        "readline/display.c",
        "readline/funmap.c",
        "readline/histexpand.c",
        "readline/histfile.c",
        "readline/history.c",
        "readline/histsearch.c",
        "readline/input.c",
        "readline/isearch.c",
        "readline/keymaps.c",
        "readline/kill.c",
        "readline/macro.c",
        "readline/mbutil.c",
        "readline/misc.c",
        "readline/nls.c",
        "readline/parens.c",
        "readline/parse-colors.c",
        "readline/readline.c",
        "readline/rltty.c",
        "readline/search.c",
        "readline/shell.c",
        "readline/signals.c",
        "readline/terminal.c",
        "readline/text.c",
        "readline/tilde.c",
        "readline/undo.c",
        "readline/util.c",
        "readline/vi_mode.c",
        "readline/xfree.c",
        "readline/xmalloc.c",
    ],
    hdrs = [
        "readline/emacs_keymap.c",
        "readline/vi_keymap.c",
    ],
    copts = COPTS,
    visibility = [
        "//visibility:private",
    ],
    deps = [
        "//ncurses:ncurses_for_third_party",
    ],
)

cc_library(
    name = "history_impl",
    srcs = glob([
        "readline/*.h",
    ]) + [
        "config.h",
        "readline/histexpand.c",
        "readline/histfile.c",
        "readline/history.c",
        "readline/histsearch.c",
        "readline/mbutil.c",
        "readline/shell.c",
        "readline/xfree.c",
        "readline/xmalloc.c",
    ],
    hdrs = [
        "readline/emacs_keymap.c",
        "readline/vi_keymap.c",
    ],
    copts = COPTS,
    visibility = [
        "//visibility:private",
    ],
    deps = [
        "//ncurses:ncurses_for_third_party",
    ],
)

[
    [
        cc_library(
            name = "%s_for_third_party" % lib,
            hdrs = EXTERNAL_HEADERS,
            includes = [
                "readline",
            ],
            deps = [
                ":%s_impl" % lib,
            ],
            visibility = [
                "//:__subpackages__",
            ],
        ),
        cc_library(
            name = lib,
            hdrs = EXTERNAL_HEADERS,
            include_prefix = "readline",
            deps = [
                ":%s_impl" % lib,
            ],
        ),
    ]
    for lib in ["readline", "history"]
]
