#!/usr/bin/env python

import sys

def _path(target):
  return target.replace('~', '/')

def _normalize(target):
  return target.replace('~', '_')

def _component_name(component):
  return '_'.join(_normalize(t) for t in component)

def _reachable(dependency, target):
  reachable = set()
  queue = set((target,))
  while queue:
    target = queue.pop()
    reachable.add(target)
    queue.update(dep for dep in dependency[target] if dep not in reachable)
  return reachable

def main(argv):
  dependency = dict()
  for line in sys.stdin:
    target, deps = map(str.strip, line.split('->', 1))
    dependency[target] = sorted(filter(None, deps.split(' ')))
  targets = sorted(dependency.keys())

  reachable = dict((target, _reachable(dependency, target)) for target in dependency)
  target_to_component = dict()
  components = list()
  for target in targets:
    if target not in target_to_component:
      component = sorted(t for t in reachable[target] if target in reachable[t])
      if len(component) > 1:
        components.append(component)
        target_to_component.update((t, component) for t in component)

  for target in targets:
    deps = dependency[target]
    print 'cc_library('
    print '  name = "%s",' % _normalize(target)
    print '  includes = ['
    print '    "boost/libs/%s/include",' % _path(target)
    print '  ],'
    print '  hdrs = glob(['
    print '    "boost/libs/%s/include/**/*.h",' % _path(target)
    print '    "boost/libs/%s/include/**/*.hpp",' % _path(target)
    print '  ]),'
    if target not in target_to_component:
      print '  srcs = glob(['
      print '    "boost/libs/%s/src/**",' % _path(target)
      print '  ]),'
      print '  deps = ['
      for dep in deps:
        print '    ":%s",' % _normalize(dep)
      print '  ],'
    else:
      print '  deps = ['
      print '    ":%s",' % _component_name(target_to_component[target])
      print '  ]'
    print ')'
    print

  for component in components:
    deps = set.difference(set.union(*(set(dependency[target]) for target in component)), set(component))
    print 'cc_library('
    print '  name = "%s",' % _component_name(component)
    print '  includes = ['
    for target in component:
      print '    "boost/libs/%s/include",' % _path(target)
    print '  ],'
    print '  hdrs = glob(['
    for target in component:
      print '    "boost/libs/%s/include/**/*.h",' % _path(target)
      print '    "boost/libs/%s/include/**/*.hpp",' % _path(target)
    print '  ]),'
    print '  srcs = glob(['
    for target in component:
      print '    "boost/libs/%s/src/**",' % _path(target)
    print '  ]),'
    print '  deps = ['
    for dep in sorted(deps):
      print '    ":%s",' % _normalize(dep)
    print '  ],'
    print '  visibility = ['
    print '    "//visibility:private",'
    print '  ],'
    print ')'
    print

if __name__ == '__main__':
  sys.exit(main(sys.argv))
