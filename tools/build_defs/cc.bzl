load(":workspace.bzl", "workspace_name")

INCLUDE_PREFIX = "third_party"

def copts_include(path, system = False, gendir = False):
    prefix = "-isystem" if system else "-I"
    prefix += "$(GENDIR)/" if gendir else ""
    return [
        "%s%s" % (prefix, path),
        "%sexternal/%s/%s" % (prefix, workspace_name(), path),
    ]
