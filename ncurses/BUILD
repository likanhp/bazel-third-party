package(default_visibility = ["//visibility:public"])

load("@bazel_shared//tools/build_defs:file.bzl", "basename", "copy")
load("@bazel_shared//tools/target_cpu:groups.bzl", "apple", "linux")

COMMON_HEADER_DIRS = [
    "gen/include",
    "ncurses/include",
    "ncurses/ncurses",
]

COPTS = []

[
    COPTS.extend([
        "-isystem",
        "ncurses/" + d,
    ])
    for d in COMMON_HEADER_DIRS
]

COPTS = COPTS + [
    "-DHAVE_CONFIG_H",
] + select(
    apple([
        "-D_DARWIN_C_SOURCE",
    ]) + linux([
        "-D_GNU_SOURCE",
    ]) + {
        "//conditions:default": [],
    },
)

EXTERNAL_HEADERS = [
    "gen/c++/etip.h",
    "gen/include/curses.h",
    "gen/include/eti.h",
    "gen/include/form.h",
    "gen/include/menu.h",
    "gen/include/ncurses_dll.h",
    "gen/include/panel.h",
    "gen/include/term.h",
    "gen/include/termcap.h",
    "gen/include/unctrl.h",
    "ncurses/c++/cursesapp.h",
    "ncurses/c++/cursesf.h",
    "ncurses/c++/cursesm.h",
    "ncurses/c++/cursesp.h",
    "ncurses/c++/cursesw.h",
    "ncurses/c++/cursslk.h",
    "ncurses/include/nc_tparm.h",
    "ncurses/include/term_entry.h",
    "ncurses/include/tic.h",
]

EXTERNAL_HEADERS_DIRS = [
    ("top_level", ""),
    ("narrowc", "/ncurses"),
    ("widec", "/ncursesw"),
]

[
    [
        copy(
            name = "copy_external_headers_%s" % name,
            srcs = EXTERNAL_HEADERS,
            dir = "include%s" % dir,
            visibility = [
                "//visibility:private",
            ],
        ),
        copy(
            name = "copy_curses_h_%s" % name,
            srcs = "gen/include/curses.h",
            dest = "include%s/ncurses.h" % dir,
            visibility = [
                "//visibility:private",
            ],
        ),
    ]
    for name, dir in EXTERNAL_HEADERS_DIRS
]

[
    [
        cc_library(
            name = "%s_for_third_party" % lib,
            hdrs = [
                "include%s/%s" % (
                    dir,
                    basename(f),
                )
                for f in EXTERNAL_HEADERS + ["ncurses.h"]
                for _, dir in EXTERNAL_HEADERS_DIRS
            ],
            includes = [
                "include",
            ],
            visibility = [
                "//:__subpackages__",
            ],
            deps = [
                ":%s_impl" % lib,
            ],
        ),
        cc_library(
            name = lib,
            hdrs = [
                "include%s/%s" % (
                    dir,
                    basename(f),
                )
                for f in EXTERNAL_HEADERS
                for _, dir in EXTERNAL_HEADERS_DIRS
            ],
            include_prefix = "include",
            deps = [
                ":%s_impl" % lib,
            ],
        ),
    ]
    for lib in [
        "form",
        "menu",
        "ncurses",
        "ncursesxx",
        "panel",
    ]
]

cc_library(
    name = "common_headers",
    hdrs = glob(["%s/*.h" % d for d in COMMON_HEADER_DIRS]) + [
        "ncurses/include/capdefaults.c",
    ],
    copts = COPTS,
    visibility = [
        "//visibility:private",
    ],
)

cc_library(
    name = "ncurses_impl",
    srcs = [
        "gen/ncurses/codes.c",
        "gen/ncurses/comp_captab.c",
        "gen/ncurses/expanded.c",
        "gen/ncurses/fallback.c",
        "gen/ncurses/lib_gen.c",
        "gen/ncurses/lib_keyname.c",
        "gen/ncurses/names.c",
        "gen/ncurses/unctrl.c",
        "ncurses/ncurses/base/define_key.c",
        "ncurses/ncurses/base/key_defined.c",
        "ncurses/ncurses/base/keybound.c",
        "ncurses/ncurses/base/keyok.c",
        "ncurses/ncurses/base/legacy_coding.c",
        "ncurses/ncurses/base/lib_addch.c",
        "ncurses/ncurses/base/lib_addstr.c",
        "ncurses/ncurses/base/lib_beep.c",
        "ncurses/ncurses/base/lib_bkgd.c",
        "ncurses/ncurses/base/lib_box.c",
        "ncurses/ncurses/base/lib_chgat.c",
        "ncurses/ncurses/base/lib_clear.c",
        "ncurses/ncurses/base/lib_clearok.c",
        "ncurses/ncurses/base/lib_clrbot.c",
        "ncurses/ncurses/base/lib_clreol.c",
        "ncurses/ncurses/base/lib_color.c",
        "ncurses/ncurses/base/lib_colorset.c",
        "ncurses/ncurses/base/lib_delch.c",
        "ncurses/ncurses/base/lib_delwin.c",
        "ncurses/ncurses/base/lib_dft_fgbg.c",
        "ncurses/ncurses/base/lib_echo.c",
        "ncurses/ncurses/base/lib_endwin.c",
        "ncurses/ncurses/base/lib_erase.c",
        "ncurses/ncurses/base/lib_flash.c",
        "ncurses/ncurses/base/lib_freeall.c",
        "ncurses/ncurses/base/lib_getch.c",
        "ncurses/ncurses/base/lib_getstr.c",
        "ncurses/ncurses/base/lib_hline.c",
        "ncurses/ncurses/base/lib_immedok.c",
        "ncurses/ncurses/base/lib_inchstr.c",
        "ncurses/ncurses/base/lib_initscr.c",
        "ncurses/ncurses/base/lib_insch.c",
        "ncurses/ncurses/base/lib_insdel.c",
        "ncurses/ncurses/base/lib_insnstr.c",
        "ncurses/ncurses/base/lib_instr.c",
        "ncurses/ncurses/base/lib_isendwin.c",
        "ncurses/ncurses/base/lib_leaveok.c",
        "ncurses/ncurses/base/lib_mouse.c",
        "ncurses/ncurses/base/lib_move.c",
        "ncurses/ncurses/base/lib_mvwin.c",
        "ncurses/ncurses/base/lib_newterm.c",
        "ncurses/ncurses/base/lib_newwin.c",
        "ncurses/ncurses/base/lib_nl.c",
        "ncurses/ncurses/base/lib_overlay.c",
        "ncurses/ncurses/base/lib_pad.c",
        "ncurses/ncurses/base/lib_printw.c",
        "ncurses/ncurses/base/lib_redrawln.c",
        "ncurses/ncurses/base/lib_refresh.c",
        "ncurses/ncurses/base/lib_restart.c",
        "ncurses/ncurses/base/lib_scanw.c",
        "ncurses/ncurses/base/lib_screen.c",
        "ncurses/ncurses/base/lib_scroll.c",
        "ncurses/ncurses/base/lib_scrollok.c",
        "ncurses/ncurses/base/lib_scrreg.c",
        "ncurses/ncurses/base/lib_set_term.c",
        "ncurses/ncurses/base/lib_slk.c",
        "ncurses/ncurses/base/lib_slkatr_set.c",
        "ncurses/ncurses/base/lib_slkatrof.c",
        "ncurses/ncurses/base/lib_slkatron.c",
        "ncurses/ncurses/base/lib_slkatrset.c",
        "ncurses/ncurses/base/lib_slkattr.c",
        "ncurses/ncurses/base/lib_slkclear.c",
        "ncurses/ncurses/base/lib_slkcolor.c",
        "ncurses/ncurses/base/lib_slkinit.c",
        "ncurses/ncurses/base/lib_slklab.c",
        "ncurses/ncurses/base/lib_slkrefr.c",
        "ncurses/ncurses/base/lib_slkset.c",
        "ncurses/ncurses/base/lib_slktouch.c",
        "ncurses/ncurses/base/lib_touch.c",
        "ncurses/ncurses/base/lib_ungetch.c",
        "ncurses/ncurses/base/lib_vline.c",
        "ncurses/ncurses/base/lib_wattroff.c",
        "ncurses/ncurses/base/lib_wattron.c",
        "ncurses/ncurses/base/lib_winch.c",
        "ncurses/ncurses/base/lib_window.c",
        "ncurses/ncurses/base/nc_panel.c",
        "ncurses/ncurses/base/new_pair.c",
        "ncurses/ncurses/base/resizeterm.c",
        "ncurses/ncurses/base/safe_sprintf.c",
        "ncurses/ncurses/base/tries.c",
        "ncurses/ncurses/base/use_window.c",
        "ncurses/ncurses/base/version.c",
        "ncurses/ncurses/base/vsscanf.c",
        "ncurses/ncurses/base/wresize.c",
        "ncurses/ncurses/tinfo/access.c",
        "ncurses/ncurses/tinfo/add_tries.c",
        "ncurses/ncurses/tinfo/alloc_entry.c",
        "ncurses/ncurses/tinfo/alloc_ttype.c",
        "ncurses/ncurses/tinfo/captoinfo.c",
        "ncurses/ncurses/tinfo/comp_error.c",
        "ncurses/ncurses/tinfo/comp_expand.c",
        "ncurses/ncurses/tinfo/comp_hash.c",
        "ncurses/ncurses/tinfo/comp_parse.c",
        "ncurses/ncurses/tinfo/comp_scan.c",
        "ncurses/ncurses/tinfo/db_iterator.c",
        "ncurses/ncurses/tinfo/doalloc.c",
        "ncurses/ncurses/tinfo/entries.c",
        "ncurses/ncurses/tinfo/free_ttype.c",
        "ncurses/ncurses/tinfo/getenv_num.c",
        "ncurses/ncurses/tinfo/hashed_db.c",
        "ncurses/ncurses/tinfo/home_terminfo.c",
        "ncurses/ncurses/tinfo/init_keytry.c",
        "ncurses/ncurses/tinfo/lib_acs.c",
        "ncurses/ncurses/tinfo/lib_baudrate.c",
        "ncurses/ncurses/tinfo/lib_cur_term.c",
        "ncurses/ncurses/tinfo/lib_data.c",
        "ncurses/ncurses/tinfo/lib_has_cap.c",
        "ncurses/ncurses/tinfo/lib_kernel.c",
        "ncurses/ncurses/tinfo/lib_longname.c",
        "ncurses/ncurses/tinfo/lib_napms.c",
        "ncurses/ncurses/tinfo/lib_options.c",
        "ncurses/ncurses/tinfo/lib_print.c",
        "ncurses/ncurses/tinfo/lib_raw.c",
        "ncurses/ncurses/tinfo/lib_setup.c",
        "ncurses/ncurses/tinfo/lib_termcap.c",
        "ncurses/ncurses/tinfo/lib_termname.c",
        "ncurses/ncurses/tinfo/lib_tgoto.c",
        "ncurses/ncurses/tinfo/lib_ti.c",
        "ncurses/ncurses/tinfo/lib_tparm.c",
        "ncurses/ncurses/tinfo/lib_tputs.c",
        "ncurses/ncurses/tinfo/lib_ttyflags.c",
        "ncurses/ncurses/tinfo/name_match.c",
        "ncurses/ncurses/tinfo/obsolete.c",
        "ncurses/ncurses/tinfo/parse_entry.c",
        "ncurses/ncurses/tinfo/read_entry.c",
        "ncurses/ncurses/tinfo/read_termcap.c",
        "ncurses/ncurses/tinfo/strings.c",
        "ncurses/ncurses/tinfo/trim_sgr0.c",
        "ncurses/ncurses/tinfo/use_screen.c",
        "ncurses/ncurses/tinfo/write_entry.c",
        "ncurses/ncurses/trace/lib_trace.c",
        "ncurses/ncurses/trace/varargs.c",
        "ncurses/ncurses/trace/visbuf.c",
        "ncurses/ncurses/tty/hardscroll.c",
        "ncurses/ncurses/tty/hashmap.c",
        "ncurses/ncurses/tty/lib_mvcur.c",
        "ncurses/ncurses/tty/lib_tstp.c",
        "ncurses/ncurses/tty/lib_twait.c",
        "ncurses/ncurses/tty/lib_vidattr.c",
        "ncurses/ncurses/tty/tty_update.c",
        "ncurses/ncurses/widechar/charable.c",
        "ncurses/ncurses/widechar/lib_add_wch.c",
        "ncurses/ncurses/widechar/lib_box_set.c",
        "ncurses/ncurses/widechar/lib_cchar.c",
        "ncurses/ncurses/widechar/lib_erasewchar.c",
        "ncurses/ncurses/widechar/lib_get_wch.c",
        "ncurses/ncurses/widechar/lib_get_wstr.c",
        "ncurses/ncurses/widechar/lib_hline_set.c",
        "ncurses/ncurses/widechar/lib_in_wch.c",
        "ncurses/ncurses/widechar/lib_in_wchnstr.c",
        "ncurses/ncurses/widechar/lib_ins_wch.c",
        "ncurses/ncurses/widechar/lib_inwstr.c",
        "ncurses/ncurses/widechar/lib_key_name.c",
        "ncurses/ncurses/widechar/lib_pecho_wchar.c",
        "ncurses/ncurses/widechar/lib_slk_wset.c",
        "ncurses/ncurses/widechar/lib_unget_wch.c",
        "ncurses/ncurses/widechar/lib_vid_attr.c",
        "ncurses/ncurses/widechar/lib_vline_set.c",
        "ncurses/ncurses/widechar/lib_wacs.c",
        "ncurses/ncurses/widechar/lib_wunctrl.c",
    ] + glob([
        "gen/ncurses/*.h",
    ]),
    copts = COPTS + [
        "-isystem",
        "ncurses/gen/ncurses",
    ],
    visibility = [
        "//visibility:private",
    ],
    deps = [
        ":common_headers",
    ],
)

cc_library(
    name = "form_impl",
    srcs = [
        "ncurses/form/fld_arg.c",
        "ncurses/form/fld_attr.c",
        "ncurses/form/fld_current.c",
        "ncurses/form/fld_def.c",
        "ncurses/form/fld_dup.c",
        "ncurses/form/fld_ftchoice.c",
        "ncurses/form/fld_ftlink.c",
        "ncurses/form/fld_info.c",
        "ncurses/form/fld_just.c",
        "ncurses/form/fld_link.c",
        "ncurses/form/fld_max.c",
        "ncurses/form/fld_move.c",
        "ncurses/form/fld_newftyp.c",
        "ncurses/form/fld_opts.c",
        "ncurses/form/fld_pad.c",
        "ncurses/form/fld_page.c",
        "ncurses/form/fld_stat.c",
        "ncurses/form/fld_type.c",
        "ncurses/form/fld_user.c",
        "ncurses/form/frm_cursor.c",
        "ncurses/form/frm_data.c",
        "ncurses/form/frm_def.c",
        "ncurses/form/frm_driver.c",
        "ncurses/form/frm_hook.c",
        "ncurses/form/frm_opts.c",
        "ncurses/form/frm_page.c",
        "ncurses/form/frm_post.c",
        "ncurses/form/frm_req_name.c",
        "ncurses/form/frm_scale.c",
        "ncurses/form/frm_sub.c",
        "ncurses/form/frm_user.c",
        "ncurses/form/frm_win.c",
        "ncurses/form/fty_alnum.c",
        "ncurses/form/fty_alpha.c",
        "ncurses/form/fty_enum.c",
        "ncurses/form/fty_generic.c",
        "ncurses/form/fty_int.c",
        "ncurses/form/fty_ipv4.c",
        "ncurses/form/fty_num.c",
        "ncurses/form/fty_regex.c",
    ] + [
        "ncurses/form/form.priv.h",
    ],
    copts = COPTS + [
        "-isystem",
        "ncurses/ncurses/form",
    ],
    visibility = [
        "//visibility:private",
    ],
    deps = [
        ":common_headers",
        ":ncurses_impl",
    ],
)

cc_library(
    name = "menu_impl",
    srcs = [
        "ncurses/menu/m_attribs.c",
        "ncurses/menu/m_cursor.c",
        "ncurses/menu/m_driver.c",
        "ncurses/menu/m_format.c",
        "ncurses/menu/m_global.c",
        "ncurses/menu/m_hook.c",
        "ncurses/menu/m_item_cur.c",
        "ncurses/menu/m_item_nam.c",
        "ncurses/menu/m_item_new.c",
        "ncurses/menu/m_item_opt.c",
        "ncurses/menu/m_item_top.c",
        "ncurses/menu/m_item_use.c",
        "ncurses/menu/m_item_val.c",
        "ncurses/menu/m_item_vis.c",
        "ncurses/menu/m_items.c",
        "ncurses/menu/m_new.c",
        "ncurses/menu/m_opts.c",
        "ncurses/menu/m_pad.c",
        "ncurses/menu/m_pattern.c",
        "ncurses/menu/m_post.c",
        "ncurses/menu/m_req_name.c",
        "ncurses/menu/m_scale.c",
        "ncurses/menu/m_spacing.c",
        "ncurses/menu/m_sub.c",
        "ncurses/menu/m_userptr.c",
        "ncurses/menu/m_win.c",
    ] + [
        "ncurses/menu/menu.priv.h",
    ],
    copts = COPTS + [
        "-isystem",
        "ncurses/ncurses/menu",
    ],
    visibility = [
        "//visibility:private",
    ],
    deps = [
        ":common_headers",
        ":ncurses_impl",
    ],
)

cc_library(
    name = "panel_impl",
    srcs = [
        "ncurses/panel/p_above.c",
        "ncurses/panel/p_below.c",
        "ncurses/panel/p_bottom.c",
        "ncurses/panel/p_delete.c",
        "ncurses/panel/p_hidden.c",
        "ncurses/panel/p_hide.c",
        "ncurses/panel/p_move.c",
        "ncurses/panel/p_new.c",
        "ncurses/panel/p_replace.c",
        "ncurses/panel/p_show.c",
        "ncurses/panel/p_top.c",
        "ncurses/panel/p_update.c",
        "ncurses/panel/p_user.c",
        "ncurses/panel/p_win.c",
        "ncurses/panel/panel.c",
    ] + [
        "ncurses/panel/panel.priv.h",
    ],
    copts = COPTS + [
        "-isystem",
        "ncurses/ncurses/panel",
    ],
    visibility = [
        "//visibility:private",
    ],
    deps = [
        ":common_headers",
        ":ncurses_impl",
    ],
)

cc_library(
    name = "ncursesxx_impl",
    srcs = glob(
        [
            "ncurses/c++/*.h",
            "ncurses/c++/*.cc",
        ],
        exclude = [
            "ncurses/c++/cursesmain.cc",
            "ncurses/c++/demo.cc",
        ],
    ) + [
        "gen/c++/etip.h",
    ],
    copts = COPTS + [
        "-isystem",
        "ncurses/gen/c++",
        "-isystem",
        "ncurses/ncurses/c++",
    ],
    visibility = [
        "//visibility:private",
    ],
    deps = [
        ":common_headers",
        ":form_impl",
        ":menu_impl",
        ":ncurses_impl",
        ":panel_impl",
    ],
)

PROG_COPTS = COPTS + [
    "-isystem",
    "ncurses/gen/progs",
    "-isystem",
    "ncurses/ncurses/progs",
]

cc_library(
    name = "progs_impl",
    hdrs = [
        "gen/progs/termsort.c",
        "ncurses/progs/progs.priv.h",
    ],
    copts = PROG_COPTS,
    visibility = [
        "//visibility:private",
    ],
    deps = [
        ":common_headers",
        ":ncurses_impl",
    ],
)

cc_binary(
    name = "bin/infocmp",
    srcs = [
        "ncurses/progs/dump_entry.c",
        "ncurses/progs/dump_entry.h",
        "ncurses/progs/infocmp.c",
    ],
    copts = PROG_COPTS,
    deps = [
        ":common_headers",
        ":progs_impl",
    ],
)

cc_binary(
    name = "bin/clear",
    srcs = [
        "ncurses/progs/clear.c",
        "ncurses/progs/clear_cmd.c",
        "ncurses/progs/clear_cmd.h",
        "ncurses/progs/tty_settings.c",
        "ncurses/progs/tty_settings.h",
    ],
    copts = PROG_COPTS,
    deps = [
        ":common_headers",
        ":progs_impl",
    ],
)

cc_binary(
    name = "bin/tabs",
    srcs = [
        "ncurses/progs/tabs.c",
        "ncurses/progs/tty_settings.c",
        "ncurses/progs/tty_settings.h",
    ],
    copts = PROG_COPTS,
    deps = [
        ":common_headers",
        ":progs_impl",
    ],
)

cc_binary(
    name = "bin/tput",
    srcs = [
        "gen/progs/transform.h",
        "ncurses/progs/clear_cmd.c",
        "ncurses/progs/clear_cmd.h",
        "ncurses/progs/reset_cmd.c",
        "ncurses/progs/reset_cmd.h",
        "ncurses/progs/tparm_type.c",
        "ncurses/progs/tparm_type.h",
        "ncurses/progs/tput.c",
        "ncurses/progs/transform.c",
        "ncurses/progs/tty_settings.c",
        "ncurses/progs/tty_settings.h",
    ],
    copts = PROG_COPTS,
    deps = [
        ":common_headers",
        ":progs_impl",
    ],
)

cc_binary(
    name = "bin/tset",
    srcs = [
        "gen/progs/transform.h",
        "ncurses/progs/reset_cmd.c",
        "ncurses/progs/reset_cmd.h",
        "ncurses/progs/transform.c",
        "ncurses/progs/tset.c",
        "ncurses/progs/tty_settings.c",
        "ncurses/progs/tty_settings.h",
    ],
    copts = PROG_COPTS,
    deps = [
        ":common_headers",
        ":progs_impl",
    ],
)

cc_binary(
    name = "bin/toe",
    srcs = [
        "ncurses/progs/toe.c",
    ],
    copts = PROG_COPTS,
    deps = [
        ":common_headers",
        ":progs_impl",
    ],
)

cc_binary(
    name = "bin/tic",
    srcs = [
        "gen/progs/transform.h",
        "ncurses/progs/dump_entry.c",
        "ncurses/progs/dump_entry.h",
        "ncurses/progs/tic.c",
        "ncurses/progs/tparm_type.c",
        "ncurses/progs/tparm_type.h",
        "ncurses/progs/transform.c",
    ],
    copts = PROG_COPTS,
    deps = [
        ":common_headers",
        ":progs_impl",
    ],
)
