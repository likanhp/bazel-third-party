def autoconf(name, template, out, vars, aliases={}, **kwargs):
  native.genrule(
      name = name,
      srcs = [template] + vars,
      outs = [out],
      tools = [
          "@bazel_third_party//tools/autoconf:autoconf",
      ],
      cmd = "$(location @bazel_third_party//tools/autoconf:autoconf)" +
            "".join([" -a %s=%s" % (k, v) for k, v in aliases.items()]) +
            "".join([" -m $(location %s)" % var for var in vars]) +
            " <$(location %s) >$@" % template,
      **kwargs
  )