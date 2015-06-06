package(
  default_visibility = [
    "//visibility:public",
  ],
)

cc_binary(
  name = "boostdep",
  srcs = ["boost/tools/boostdep/src/boostdep.cpp"],
  deps = [
    ":filesystem",
  ],
)

# The following contents are auto generated.  DO NOT modify manually.

# To generate boost modules dependencies, run
# bazel build -c opt boost:boostdep
# cd boost/boost
# ../../bazel-bin/boost/boostdep --track-sources --list-dependencies \
#   | ../generate_build.py | cat ../BUILD.in - > ../BUILD

cc_library(
  name = "accumulators",
  includes = [
    "boost/libs/accumulators/include",
  ],
  hdrs = glob([
    "boost/libs/accumulators/include/**/*.h",
    "boost/libs/accumulators/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/accumulators/src/**",
  ]),
  deps = [
    ":array",
    ":assert",
    ":circular_buffer",
    ":concept_check",
    ":config",
    ":core",
    ":fusion",
    ":iterator",
    ":mpl",
    ":numeric_conversion",
    ":numeric_ublas",
    ":parameter",
    ":preprocessor",
    ":range",
    ":static_assert",
    ":throw_exception",
    ":tuple",
    ":type_traits",
    ":typeof",
  ],
)

cc_library(
  name = "algorithm",
  includes = [
    "boost/libs/algorithm/include",
  ],
  hdrs = glob([
    "boost/libs/algorithm/include/**/*.h",
    "boost/libs/algorithm/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/algorithm/src/**",
  ]),
  deps = [
    ":array",
    ":assert",
    ":bind",
    ":concept_check",
    ":config",
    ":core",
    ":exception",
    ":function",
    ":iterator",
    ":mpl",
    ":range",
    ":regex",
    ":static_assert",
    ":tuple",
    ":type_traits",
    ":unordered",
  ],
)

cc_library(
  name = "align",
  includes = [
    "boost/libs/align/include",
  ],
  hdrs = glob([
    "boost/libs/align/include/**/*.h",
    "boost/libs/align/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/align/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":core",
    ":static_assert",
    ":throw_exception",
  ],
)

cc_library(
  name = "any",
  includes = [
    "boost/libs/any/include",
  ],
  hdrs = glob([
    "boost/libs/any/include/**/*.h",
    "boost/libs/any/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/any/src/**",
  ]),
  deps = [
    ":config",
    ":core",
    ":mpl",
    ":static_assert",
    ":throw_exception",
    ":type_index",
    ":type_traits",
  ],
)

cc_library(
  name = "array",
  includes = [
    "boost/libs/array/include",
  ],
  hdrs = glob([
    "boost/libs/array/include/**/*.h",
    "boost/libs/array/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/array/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":core",
    ":functional",
    ":throw_exception",
  ],
)

cc_library(
  name = "asio",
  includes = [
    "boost/libs/asio/include",
  ],
  hdrs = glob([
    "boost/libs/asio/include/**/*.h",
    "boost/libs/asio/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/asio/src/**",
  ]),
  deps = [
    ":array",
    ":assert",
    ":bind",
    ":chrono",
    ":config",
    ":core",
    ":coroutine",
    ":date_time",
    ":function",
    ":regex",
    ":smart_ptr",
    ":system",
    ":throw_exception",
    ":type_traits",
  ],
)

cc_library(
  name = "assert",
  includes = [
    "boost/libs/assert/include",
  ],
  hdrs = glob([
    "boost/libs/assert/include/**/*.h",
    "boost/libs/assert/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/assert/src/**",
  ]),
  deps = [
    ":config",
  ],
)

cc_library(
  name = "assign",
  includes = [
    "boost/libs/assign/include",
  ],
  hdrs = glob([
    "boost/libs/assign/include/**/*.h",
    "boost/libs/assign/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/assign/src/**",
  ]),
  deps = [
    ":array",
    ":config",
    ":mpl",
    ":preprocessor",
    ":ptr_container",
    ":range",
    ":static_assert",
    ":tuple",
    ":type_traits",
  ],
)

cc_library(
  name = "atomic",
  includes = [
    "boost/libs/atomic/include",
  ],
  hdrs = glob([
    "boost/libs/atomic/include/**/*.h",
    "boost/libs/atomic/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/atomic/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":type_traits",
  ],
)

cc_library(
  name = "bimap",
  includes = [
    "boost/libs/bimap/include",
  ],
  hdrs = glob([
    "boost/libs/bimap/include/**/*.h",
    "boost/libs/bimap/include/**/*.hpp",
  ]),
  deps = [
    ":bimap_disjoint_sets_graph_graph_parallel_mpi_parameter_property_map_python",
  ]
)

cc_library(
  name = "bind",
  includes = [
    "boost/libs/bind/include",
  ],
  hdrs = glob([
    "boost/libs/bind/include/**/*.h",
    "boost/libs/bind/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/bind/src/**",
  ]),
  deps = [
    ":config",
    ":core",
    ":static_assert",
  ],
)

cc_library(
  name = "chrono",
  includes = [
    "boost/libs/chrono/include",
  ],
  hdrs = glob([
    "boost/libs/chrono/include/**/*.h",
    "boost/libs/chrono/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/chrono/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":core",
    ":integer",
    ":move",
    ":mpl",
    ":predef",
    ":ratio",
    ":static_assert",
    ":system",
    ":throw_exception",
    ":type_traits",
    ":typeof",
    ":utility",
    ":winapi",
  ],
)

cc_library(
  name = "chrono_stopwatches",
  includes = [
    "boost/libs/chrono/stopwatches/include",
  ],
  hdrs = glob([
    "boost/libs/chrono/stopwatches/include/**/*.h",
    "boost/libs/chrono/stopwatches/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/chrono/stopwatches/src/**",
  ]),
  deps = [
    ":accumulators",
    ":assert",
    ":chrono",
    ":config",
    ":format",
    ":system",
  ],
)

cc_library(
  name = "circular_buffer",
  includes = [
    "boost/libs/circular_buffer/include",
  ],
  hdrs = glob([
    "boost/libs/circular_buffer/include/**/*.h",
    "boost/libs/circular_buffer/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/circular_buffer/src/**",
  ]),
  deps = [
    ":assert",
    ":concept_check",
    ":config",
    ":container",
    ":core",
    ":iterator",
    ":move",
    ":static_assert",
    ":throw_exception",
    ":type_traits",
    ":utility",
  ],
)

cc_library(
  name = "compatibility",
  includes = [
    "boost/libs/compatibility/include",
  ],
  hdrs = glob([
    "boost/libs/compatibility/include/**/*.h",
    "boost/libs/compatibility/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/compatibility/src/**",
  ]),
  deps = [
  ],
)

cc_library(
  name = "concept_check",
  includes = [
    "boost/libs/concept_check/include",
  ],
  hdrs = glob([
    "boost/libs/concept_check/include/**/*.h",
    "boost/libs/concept_check/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/concept_check/src/**",
  ]),
  deps = [
    ":config",
    ":core",
    ":mpl",
    ":preprocessor",
    ":type_traits",
  ],
)

cc_library(
  name = "config",
  includes = [
    "boost/libs/config/include",
  ],
  hdrs = glob([
    "boost/libs/config/include/**/*.h",
    "boost/libs/config/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/config/src/**",
  ]),
  deps = [
  ],
)

cc_library(
  name = "container",
  includes = [
    "boost/libs/container/include",
  ],
  hdrs = glob([
    "boost/libs/container/include/**/*.h",
    "boost/libs/container/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/container/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":core",
    ":functional",
    ":intrusive",
    ":move",
    ":static_assert",
  ],
)

cc_library(
  name = "context",
  includes = [
    "boost/libs/context/include",
  ],
  hdrs = glob([
    "boost/libs/context/include/**/*.h",
    "boost/libs/context/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/context/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":smart_ptr",
    ":thread",
  ],
)

cc_library(
  name = "conversion",
  includes = [
    "boost/libs/conversion/include",
  ],
  hdrs = glob([
    "boost/libs/conversion/include/**/*.h",
    "boost/libs/conversion/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/conversion/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":smart_ptr",
    ":throw_exception",
    ":type_traits",
    ":typeof",
  ],
)

cc_library(
  name = "core",
  includes = [
    "boost/libs/core/include",
  ],
  hdrs = glob([
    "boost/libs/core/include/**/*.h",
    "boost/libs/core/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/core/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
  ],
)

cc_library(
  name = "coroutine",
  includes = [
    "boost/libs/coroutine/include",
  ],
  hdrs = glob([
    "boost/libs/coroutine/include/**/*.h",
    "boost/libs/coroutine/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/coroutine/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":context",
    ":core",
    ":exception",
    ":move",
    ":range",
    ":system",
    ":thread",
    ":throw_exception",
    ":type_traits",
    ":utility",
  ],
)

cc_library(
  name = "crc",
  includes = [
    "boost/libs/crc/include",
  ],
  hdrs = glob([
    "boost/libs/crc/include/**/*.h",
    "boost/libs/crc/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/crc/src/**",
  ]),
  deps = [
    ":config",
    ":integer",
  ],
)

cc_library(
  name = "date_time",
  includes = [
    "boost/libs/date_time/include",
  ],
  hdrs = glob([
    "boost/libs/date_time/include/**/*.h",
    "boost/libs/date_time/include/**/*.hpp",
  ]),
  deps = [
    ":date_time_pool_serialization_spirit_thread",
  ]
)

cc_library(
  name = "detail",
  includes = [
    "boost/libs/detail/include",
  ],
  hdrs = glob([
    "boost/libs/detail/include/**/*.h",
    "boost/libs/detail/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/detail/src/**",
  ]),
  deps = [
    ":config",
    ":core",
    ":mpl",
    ":preprocessor",
    ":static_assert",
    ":type_traits",
  ],
)

cc_library(
  name = "disjoint_sets",
  includes = [
    "boost/libs/disjoint_sets/include",
  ],
  hdrs = glob([
    "boost/libs/disjoint_sets/include/**/*.h",
    "boost/libs/disjoint_sets/include/**/*.hpp",
  ]),
  deps = [
    ":bimap_disjoint_sets_graph_graph_parallel_mpi_parameter_property_map_python",
  ]
)

cc_library(
  name = "dynamic_bitset",
  includes = [
    "boost/libs/dynamic_bitset/include",
  ],
  hdrs = glob([
    "boost/libs/dynamic_bitset/include/**/*.h",
    "boost/libs/dynamic_bitset/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/dynamic_bitset/src/**",
  ]),
  deps = [
    ":config",
    ":core",
    ":integer",
    ":move",
    ":static_assert",
    ":throw_exception",
  ],
)

cc_library(
  name = "endian",
  includes = [
    "boost/libs/endian/include",
  ],
  hdrs = glob([
    "boost/libs/endian/include/**/*.h",
    "boost/libs/endian/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/endian/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":core",
    ":predef",
    ":static_assert",
    ":system",
    ":type_traits",
    ":utility",
  ],
)

cc_library(
  name = "exception",
  includes = [
    "boost/libs/exception/include",
  ],
  hdrs = glob([
    "boost/libs/exception/include/**/*.h",
    "boost/libs/exception/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/exception/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":core",
    ":smart_ptr",
    ":throw_exception",
    ":tuple",
  ],
)

cc_library(
  name = "filesystem",
  includes = [
    "boost/libs/filesystem/include",
  ],
  hdrs = glob([
    "boost/libs/filesystem/include/**/*.h",
    "boost/libs/filesystem/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/filesystem/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":core",
    ":detail",
    ":functional",
    ":io",
    ":iterator",
    ":range",
    ":smart_ptr",
    ":static_assert",
    ":system",
    ":type_traits",
  ],
)

cc_library(
  name = "flyweight",
  includes = [
    "boost/libs/flyweight/include",
  ],
  hdrs = glob([
    "boost/libs/flyweight/include/**/*.h",
    "boost/libs/flyweight/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/flyweight/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":core",
    ":detail",
    ":functional",
    ":interprocess",
    ":mpl",
    ":multi_index",
    ":parameter",
    ":preprocessor",
    ":serialization",
    ":smart_ptr",
    ":throw_exception",
    ":type_traits",
  ],
)

cc_library(
  name = "foreach",
  includes = [
    "boost/libs/foreach/include",
  ],
  hdrs = glob([
    "boost/libs/foreach/include/**/*.h",
    "boost/libs/foreach/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/foreach/src/**",
  ]),
  deps = [
    ":config",
    ":core",
    ":iterator",
    ":mpl",
    ":range",
    ":type_traits",
  ],
)

cc_library(
  name = "format",
  includes = [
    "boost/libs/format/include",
  ],
  hdrs = glob([
    "boost/libs/format/include/**/*.h",
    "boost/libs/format/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/format/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":optional",
    ":smart_ptr",
    ":throw_exception",
    ":utility",
  ],
)

cc_library(
  name = "function",
  includes = [
    "boost/libs/function/include",
  ],
  hdrs = glob([
    "boost/libs/function/include/**/*.h",
    "boost/libs/function/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/function/src/**",
  ]),
  deps = [
    ":assert",
    ":bind",
    ":config",
    ":core",
    ":integer",
    ":move",
    ":mpl",
    ":preprocessor",
    ":throw_exception",
    ":type_traits",
    ":typeof",
  ],
)

cc_library(
  name = "function_types",
  includes = [
    "boost/libs/function_types/include",
  ],
  hdrs = glob([
    "boost/libs/function_types/include/**/*.h",
    "boost/libs/function_types/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/function_types/src/**",
  ]),
  deps = [
    ":config",
    ":core",
    ":detail",
    ":mpl",
    ":preprocessor",
    ":type_traits",
  ],
)

cc_library(
  name = "functional",
  includes = [
    "boost/libs/functional/include",
  ],
  hdrs = glob([
    "boost/libs/functional/include/**/*.h",
    "boost/libs/functional/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/functional/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":core",
    ":detail",
    ":function",
    ":function_types",
    ":integer",
    ":iterator",
    ":mpl",
    ":optional",
    ":preprocessor",
    ":static_assert",
    ":type_traits",
    ":typeof",
    ":utility",
  ],
)

cc_library(
  name = "fusion",
  includes = [
    "boost/libs/fusion/include",
  ],
  hdrs = glob([
    "boost/libs/fusion/include/**/*.h",
    "boost/libs/fusion/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/fusion/src/**",
  ]),
  deps = [
    ":config",
    ":core",
    ":function_types",
    ":functional",
    ":mpl",
    ":preprocessor",
    ":static_assert",
    ":tuple",
    ":type_traits",
    ":typeof",
    ":utility",
  ],
)

cc_library(
  name = "geometry",
  includes = [
    "boost/libs/geometry/include",
  ],
  hdrs = glob([
    "boost/libs/geometry/include/**/*.h",
    "boost/libs/geometry/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/geometry/src/**",
  ]),
  deps = [
    ":algorithm",
    ":array",
    ":assert",
    ":concept_check",
    ":config",
    ":container",
    ":core",
    ":function_types",
    ":fusion",
    ":integer",
    ":iterator",
    ":lexical_cast",
    ":math",
    ":move",
    ":mpl",
    ":multiprecision",
    ":numeric_conversion",
    ":numeric_ublas",
    ":polygon",
    ":range",
    ":rational",
    ":serialization",
    ":smart_ptr",
    ":static_assert",
    ":throw_exception",
    ":tokenizer",
    ":tuple",
    ":type_traits",
    ":utility",
    ":variant",
  ],
)

cc_library(
  name = "gil",
  includes = [
    "boost/libs/gil/include",
  ],
  hdrs = glob([
    "boost/libs/gil/include/**/*.h",
    "boost/libs/gil/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/gil/src/**",
  ]),
  deps = [
    ":bind",
    ":concept_check",
    ":config",
    ":core",
    ":iterator",
    ":mpl",
    ":preprocessor",
    ":smart_ptr",
    ":static_assert",
    ":type_traits",
  ],
)

cc_library(
  name = "graph",
  includes = [
    "boost/libs/graph/include",
  ],
  hdrs = glob([
    "boost/libs/graph/include/**/*.h",
    "boost/libs/graph/include/**/*.hpp",
  ]),
  deps = [
    ":bimap_disjoint_sets_graph_graph_parallel_mpi_parameter_property_map_python",
  ]
)

cc_library(
  name = "graph_parallel",
  includes = [
    "boost/libs/graph_parallel/include",
  ],
  hdrs = glob([
    "boost/libs/graph_parallel/include/**/*.h",
    "boost/libs/graph_parallel/include/**/*.hpp",
  ]),
  deps = [
    ":bimap_disjoint_sets_graph_graph_parallel_mpi_parameter_property_map_python",
  ]
)

cc_library(
  name = "heap",
  includes = [
    "boost/libs/heap/include",
  ],
  hdrs = glob([
    "boost/libs/heap/include/**/*.h",
    "boost/libs/heap/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/heap/src/**",
  ]),
  deps = [
    ":array",
    ":assert",
    ":bind",
    ":concept_check",
    ":config",
    ":intrusive",
    ":iterator",
    ":mpl",
    ":parameter",
    ":static_assert",
    ":throw_exception",
    ":type_traits",
  ],
)

cc_library(
  name = "icl",
  includes = [
    "boost/libs/icl/include",
  ],
  hdrs = glob([
    "boost/libs/icl/include/**/*.h",
    "boost/libs/icl/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/icl/src/**",
  ]),
  deps = [
    ":assert",
    ":concept_check",
    ":config",
    ":container",
    ":core",
    ":date_time",
    ":detail",
    ":iterator",
    ":move",
    ":mpl",
    ":rational",
    ":static_assert",
    ":type_traits",
    ":utility",
  ],
)

cc_library(
  name = "integer",
  includes = [
    "boost/libs/integer/include",
  ],
  hdrs = glob([
    "boost/libs/integer/include/**/*.h",
    "boost/libs/integer/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/integer/src/**",
  ]),
  deps = [
    ":config",
    ":static_assert",
  ],
)

cc_library(
  name = "interprocess",
  includes = [
    "boost/libs/interprocess/include",
  ],
  hdrs = glob([
    "boost/libs/interprocess/include/**/*.h",
    "boost/libs/interprocess/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/interprocess/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":container",
    ":core",
    ":date_time",
    ":integer",
    ":intrusive",
    ":move",
    ":static_assert",
    ":unordered",
    ":winapi",
  ],
)

cc_library(
  name = "intrusive",
  includes = [
    "boost/libs/intrusive/include",
  ],
  hdrs = glob([
    "boost/libs/intrusive/include/**/*.h",
    "boost/libs/intrusive/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/intrusive/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":core",
    ":functional",
    ":move",
    ":static_assert",
  ],
)

cc_library(
  name = "io",
  includes = [
    "boost/libs/io/include",
  ],
  hdrs = glob([
    "boost/libs/io/include/**/*.h",
    "boost/libs/io/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/io/src/**",
  ]),
  deps = [
    ":config",
  ],
)

cc_library(
  name = "iostreams",
  includes = [
    "boost/libs/iostreams/include",
  ],
  hdrs = glob([
    "boost/libs/iostreams/include/**/*.h",
    "boost/libs/iostreams/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/iostreams/src/**",
  ]),
  deps = [
    ":assert",
    ":bind",
    ":config",
    ":core",
    ":detail",
    ":function",
    ":integer",
    ":mpl",
    ":preprocessor",
    ":random",
    ":range",
    ":regex",
    ":smart_ptr",
    ":static_assert",
    ":throw_exception",
    ":type_traits",
    ":utility",
  ],
)

cc_library(
  name = "iterator",
  includes = [
    "boost/libs/iterator/include",
  ],
  hdrs = glob([
    "boost/libs/iterator/include/**/*.h",
    "boost/libs/iterator/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/iterator/src/**",
  ]),
  deps = [
    ":assert",
    ":concept_check",
    ":config",
    ":conversion",
    ":core",
    ":detail",
    ":function_types",
    ":mpl",
    ":optional",
    ":smart_ptr",
    ":static_assert",
    ":tuple",
    ":type_traits",
    ":utility",
  ],
)

cc_library(
  name = "lambda",
  includes = [
    "boost/libs/lambda/include",
  ],
  hdrs = glob([
    "boost/libs/lambda/include/**/*.h",
    "boost/libs/lambda/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/lambda/src/**",
  ]),
  deps = [
    ":bind",
    ":config",
    ":core",
    ":detail",
    ":iterator",
    ":mpl",
    ":preprocessor",
    ":tuple",
    ":type_traits",
    ":utility",
  ],
)

cc_library(
  name = "lexical_cast",
  includes = [
    "boost/libs/lexical_cast/include",
  ],
  hdrs = glob([
    "boost/libs/lexical_cast/include/**/*.h",
    "boost/libs/lexical_cast/include/**/*.hpp",
  ]),
  deps = [
    ":lexical_cast_math",
  ]
)

cc_library(
  name = "local_function",
  includes = [
    "boost/libs/local_function/include",
  ],
  hdrs = glob([
    "boost/libs/local_function/include/**/*.h",
    "boost/libs/local_function/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/local_function/src/**",
  ]),
  deps = [
    ":config",
    ":mpl",
    ":preprocessor",
    ":scope_exit",
    ":type_traits",
    ":typeof",
    ":utility",
  ],
)

cc_library(
  name = "locale",
  includes = [
    "boost/libs/locale/include",
  ],
  hdrs = glob([
    "boost/libs/locale/include/**/*.h",
    "boost/libs/locale/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/locale/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":function",
    ":iterator",
    ":smart_ptr",
    ":thread",
    ":type_traits",
    ":unordered",
  ],
)

cc_library(
  name = "lockfree",
  includes = [
    "boost/libs/lockfree/include",
  ],
  hdrs = glob([
    "boost/libs/lockfree/include/**/*.h",
    "boost/libs/lockfree/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/lockfree/src/**",
  ]),
  deps = [
    ":array",
    ":assert",
    ":atomic",
    ":config",
    ":core",
    ":integer",
    ":mpl",
    ":parameter",
    ":static_assert",
    ":tuple",
    ":type_traits",
    ":utility",
  ],
)

cc_library(
  name = "log",
  includes = [
    "boost/libs/log/include",
  ],
  hdrs = glob([
    "boost/libs/log/include/**/*.h",
    "boost/libs/log/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/log/src/**",
  ]),
  deps = [
    ":align",
    ":array",
    ":asio",
    ":assert",
    ":bind",
    ":config",
    ":core",
    ":date_time",
    ":exception",
    ":filesystem",
    ":function_types",
    ":fusion",
    ":intrusive",
    ":io",
    ":iterator",
    ":lexical_cast",
    ":move",
    ":mpl",
    ":optional",
    ":parameter",
    ":phoenix",
    ":predef",
    ":preprocessor",
    ":property_tree",
    ":proto",
    ":range",
    ":regex",
    ":smart_ptr",
    ":spirit",
    ":static_assert",
    ":system",
    ":thread",
    ":throw_exception",
    ":type_traits",
    ":utility",
    ":winapi",
    ":xpressive",
  ],
)

cc_library(
  name = "logic",
  includes = [
    "boost/libs/logic/include",
  ],
  hdrs = glob([
    "boost/libs/logic/include/**/*.h",
    "boost/libs/logic/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/logic/src/**",
  ]),
  deps = [
    ":config",
    ":core",
  ],
)

cc_library(
  name = "math",
  includes = [
    "boost/libs/math/include",
  ],
  hdrs = glob([
    "boost/libs/math/include/**/*.h",
    "boost/libs/math/include/**/*.hpp",
  ]),
  deps = [
    ":lexical_cast_math",
  ]
)

cc_library(
  name = "move",
  includes = [
    "boost/libs/move/include",
  ],
  hdrs = glob([
    "boost/libs/move/include/**/*.h",
    "boost/libs/move/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/move/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":core",
    ":static_assert",
  ],
)

cc_library(
  name = "mpi",
  includes = [
    "boost/libs/mpi/include",
  ],
  hdrs = glob([
    "boost/libs/mpi/include/**/*.h",
    "boost/libs/mpi/include/**/*.hpp",
  ]),
  deps = [
    ":bimap_disjoint_sets_graph_graph_parallel_mpi_parameter_property_map_python",
  ]
)

cc_library(
  name = "mpl",
  includes = [
    "boost/libs/mpl/include",
  ],
  hdrs = glob([
    "boost/libs/mpl/include/**/*.h",
    "boost/libs/mpl/include/**/*.hpp",
  ]),
  deps = [
    ":mpl_type_traits_typeof_utility",
  ]
)

cc_library(
  name = "msm",
  includes = [
    "boost/libs/msm/include",
  ],
  hdrs = glob([
    "boost/libs/msm/include/**/*.h",
    "boost/libs/msm/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/msm/src/**",
  ]),
  deps = [
    ":any",
    ":assert",
    ":bind",
    ":circular_buffer",
    ":config",
    ":core",
    ":function",
    ":fusion",
    ":mpl",
    ":parameter",
    ":phoenix",
    ":preprocessor",
    ":proto",
    ":serialization",
    ":tuple",
    ":type_traits",
    ":typeof",
  ],
)

cc_library(
  name = "multi_array",
  includes = [
    "boost/libs/multi_array/include",
  ],
  hdrs = glob([
    "boost/libs/multi_array/include/**/*.h",
    "boost/libs/multi_array/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/multi_array/src/**",
  ]),
  deps = [
    ":array",
    ":assert",
    ":concept_check",
    ":config",
    ":core",
    ":functional",
    ":iterator",
    ":mpl",
    ":static_assert",
    ":type_traits",
  ],
)

cc_library(
  name = "multi_index",
  includes = [
    "boost/libs/multi_index/include",
  ],
  hdrs = glob([
    "boost/libs/multi_index/include/**/*.h",
    "boost/libs/multi_index/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/multi_index/src/**",
  ]),
  deps = [
    ":assert",
    ":bind",
    ":config",
    ":core",
    ":detail",
    ":foreach",
    ":functional",
    ":integer",
    ":iterator",
    ":move",
    ":mpl",
    ":preprocessor",
    ":serialization",
    ":smart_ptr",
    ":static_assert",
    ":throw_exception",
    ":tuple",
    ":type_traits",
    ":utility",
  ],
)

cc_library(
  name = "multiprecision",
  includes = [
    "boost/libs/multiprecision/include",
  ],
  hdrs = glob([
    "boost/libs/multiprecision/include/**/*.h",
    "boost/libs/multiprecision/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/multiprecision/src/**",
  ]),
  deps = [
    ":array",
    ":assert",
    ":config",
    ":core",
    ":integer",
    ":lexical_cast",
    ":math",
    ":mpl",
    ":predef",
    ":random",
    ":rational",
    ":smart_ptr",
    ":static_assert",
    ":throw_exception",
    ":type_traits",
  ],
)

cc_library(
  name = "numeric_conversion",
  includes = [
    "boost/libs/numeric/conversion/include",
  ],
  hdrs = glob([
    "boost/libs/numeric/conversion/include/**/*.h",
    "boost/libs/numeric/conversion/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/numeric/conversion/src/**",
  ]),
  deps = [
    ":config",
    ":conversion",
    ":core",
    ":mpl",
    ":preprocessor",
    ":throw_exception",
    ":type_traits",
  ],
)

cc_library(
  name = "numeric_interval",
  includes = [
    "boost/libs/numeric/interval/include",
  ],
  hdrs = glob([
    "boost/libs/numeric/interval/include/**/*.h",
    "boost/libs/numeric/interval/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/numeric/interval/src/**",
  ]),
  deps = [
    ":config",
    ":detail",
    ":logic",
  ],
)

cc_library(
  name = "numeric_odeint",
  includes = [
    "boost/libs/numeric/odeint/include",
  ],
  hdrs = glob([
    "boost/libs/numeric/odeint/include/**/*.h",
    "boost/libs/numeric/odeint/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/numeric/odeint/src/**",
  ]),
  deps = [
    ":array",
    ":assert",
    ":bind",
    ":config",
    ":core",
    ":function",
    ":fusion",
    ":iterator",
    ":math",
    ":mpi",
    ":mpl",
    ":multi_array",
    ":numeric_ublas",
    ":preprocessor",
    ":range",
    ":static_assert",
    ":throw_exception",
    ":type_traits",
    ":units",
    ":utility",
  ],
)

cc_library(
  name = "numeric_ublas",
  includes = [
    "boost/libs/numeric/ublas/include",
  ],
  hdrs = glob([
    "boost/libs/numeric/ublas/include/**/*.h",
    "boost/libs/numeric/ublas/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/numeric/ublas/src/**",
  ]),
  deps = [
    ":concept_check",
    ":config",
    ":core",
    ":iterator",
    ":mpl",
    ":numeric_interval",
    ":range",
    ":serialization",
    ":smart_ptr",
    ":static_assert",
    ":type_traits",
    ":typeof",
    ":utility",
  ],
)

cc_library(
  name = "optional",
  includes = [
    "boost/libs/optional/include",
  ],
  hdrs = glob([
    "boost/libs/optional/include/**/*.h",
    "boost/libs/optional/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/optional/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":core",
    ":detail",
    ":move",
    ":mpl",
    ":static_assert",
    ":throw_exception",
    ":type_traits",
    ":utility",
  ],
)

cc_library(
  name = "parameter",
  includes = [
    "boost/libs/parameter/include",
  ],
  hdrs = glob([
    "boost/libs/parameter/include/**/*.h",
    "boost/libs/parameter/include/**/*.hpp",
  ]),
  deps = [
    ":bimap_disjoint_sets_graph_graph_parallel_mpi_parameter_property_map_python",
  ]
)

cc_library(
  name = "phoenix",
  includes = [
    "boost/libs/phoenix/include",
  ],
  hdrs = glob([
    "boost/libs/phoenix/include/**/*.h",
    "boost/libs/phoenix/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/phoenix/src/**",
  ]),
  deps = [
    ":assert",
    ":bind",
    ":config",
    ":core",
    ":detail",
    ":function",
    ":fusion",
    ":mpl",
    ":predef",
    ":preprocessor",
    ":proto",
    ":range",
    ":smart_ptr",
    ":type_traits",
    ":utility",
  ],
)

cc_library(
  name = "polygon",
  includes = [
    "boost/libs/polygon/include",
  ],
  hdrs = glob([
    "boost/libs/polygon/include/**/*.h",
    "boost/libs/polygon/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/polygon/src/**",
  ]),
  deps = [
    ":config",
    ":core",
    ":mpl",
  ],
)

cc_library(
  name = "pool",
  includes = [
    "boost/libs/pool/include",
  ],
  hdrs = glob([
    "boost/libs/pool/include/**/*.h",
    "boost/libs/pool/include/**/*.hpp",
  ]),
  deps = [
    ":date_time_pool_serialization_spirit_thread",
  ]
)

cc_library(
  name = "predef",
  includes = [
    "boost/libs/predef/include",
  ],
  hdrs = glob([
    "boost/libs/predef/include/**/*.h",
    "boost/libs/predef/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/predef/src/**",
  ]),
  deps = [
  ],
)

cc_library(
  name = "preprocessor",
  includes = [
    "boost/libs/preprocessor/include",
  ],
  hdrs = glob([
    "boost/libs/preprocessor/include/**/*.h",
    "boost/libs/preprocessor/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/preprocessor/src/**",
  ]),
  deps = [
  ],
)

cc_library(
  name = "program_options",
  includes = [
    "boost/libs/program_options/include",
  ],
  hdrs = glob([
    "boost/libs/program_options/include/**/*.h",
    "boost/libs/program_options/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/program_options/src/**",
  ]),
  deps = [
    ":any",
    ":bind",
    ":config",
    ":core",
    ":detail",
    ":function",
    ":iterator",
    ":lexical_cast",
    ":smart_ptr",
    ":static_assert",
    ":throw_exception",
    ":tokenizer",
    ":type_traits",
  ],
)

cc_library(
  name = "property_map",
  includes = [
    "boost/libs/property_map/include",
  ],
  hdrs = glob([
    "boost/libs/property_map/include/**/*.h",
    "boost/libs/property_map/include/**/*.hpp",
  ]),
  deps = [
    ":bimap_disjoint_sets_graph_graph_parallel_mpi_parameter_property_map_python",
  ]
)

cc_library(
  name = "property_tree",
  includes = [
    "boost/libs/property_tree/include",
  ],
  hdrs = glob([
    "boost/libs/property_tree/include/**/*.h",
    "boost/libs/property_tree/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/property_tree/src/**",
  ]),
  deps = [
    ":any",
    ":assert",
    ":config",
    ":core",
    ":iterator",
    ":mpl",
    ":multi_index",
    ":optional",
    ":serialization",
    ":spirit",
    ":static_assert",
    ":throw_exception",
    ":type_traits",
    ":utility",
  ],
)

cc_library(
  name = "proto",
  includes = [
    "boost/libs/proto/include",
  ],
  hdrs = glob([
    "boost/libs/proto/include/**/*.h",
    "boost/libs/proto/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/proto/src/**",
  ]),
  deps = [
    ":config",
    ":core",
    ":fusion",
    ":mpl",
    ":preprocessor",
    ":range",
    ":static_assert",
    ":type_traits",
    ":typeof",
    ":utility",
  ],
)

cc_library(
  name = "ptr_container",
  includes = [
    "boost/libs/ptr_container/include",
  ],
  hdrs = glob([
    "boost/libs/ptr_container/include/**/*.h",
    "boost/libs/ptr_container/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/ptr_container/src/**",
  ]),
  deps = [
    ":array",
    ":assert",
    ":circular_buffer",
    ":config",
    ":core",
    ":iterator",
    ":mpl",
    ":range",
    ":serialization",
    ":smart_ptr",
    ":static_assert",
    ":type_traits",
    ":unordered",
    ":utility",
  ],
)

cc_library(
  name = "python",
  includes = [
    "boost/libs/python/include",
  ],
  hdrs = glob([
    "boost/libs/python/include/**/*.h",
    "boost/libs/python/include/**/*.hpp",
  ]),
  deps = [
    ":bimap_disjoint_sets_graph_graph_parallel_mpi_parameter_property_map_python",
  ]
)

cc_library(
  name = "random",
  includes = [
    "boost/libs/random/include",
  ],
  hdrs = glob([
    "boost/libs/random/include/**/*.h",
    "boost/libs/random/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/random/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":core",
    ":integer",
    ":mpl",
    ":range",
    ":static_assert",
    ":system",
    ":throw_exception",
    ":type_traits",
    ":utility",
  ],
)

cc_library(
  name = "range",
  includes = [
    "boost/libs/range/include",
  ],
  hdrs = glob([
    "boost/libs/range/include/**/*.h",
    "boost/libs/range/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/range/src/**",
  ]),
  deps = [
    ":array",
    ":assert",
    ":concept_check",
    ":config",
    ":core",
    ":detail",
    ":functional",
    ":iterator",
    ":mpl",
    ":numeric_conversion",
    ":optional",
    ":preprocessor",
    ":regex",
    ":static_assert",
    ":tuple",
    ":type_traits",
    ":utility",
  ],
)

cc_library(
  name = "ratio",
  includes = [
    "boost/libs/ratio/include",
  ],
  hdrs = glob([
    "boost/libs/ratio/include/**/*.h",
    "boost/libs/ratio/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/ratio/src/**",
  ]),
  deps = [
    ":config",
    ":core",
    ":integer",
    ":mpl",
    ":rational",
    ":static_assert",
    ":type_traits",
  ],
)

cc_library(
  name = "rational",
  includes = [
    "boost/libs/rational/include",
  ],
  hdrs = glob([
    "boost/libs/rational/include/**/*.h",
    "boost/libs/rational/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/rational/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":integer",
    ":static_assert",
    ":utility",
  ],
)

cc_library(
  name = "regex",
  includes = [
    "boost/libs/regex/include",
  ],
  hdrs = glob([
    "boost/libs/regex/include/**/*.h",
    "boost/libs/regex/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/regex/src/**",
  ]),
  deps = [
    ":assert",
    ":concept_check",
    ":config",
    ":core",
    ":functional",
    ":integer",
    ":iterator",
    ":mpl",
    ":smart_ptr",
    ":static_assert",
    ":throw_exception",
    ":type_traits",
  ],
)

cc_library(
  name = "scope_exit",
  includes = [
    "boost/libs/scope_exit/include",
  ],
  hdrs = glob([
    "boost/libs/scope_exit/include/**/*.h",
    "boost/libs/scope_exit/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/scope_exit/src/**",
  ]),
  deps = [
    ":config",
    ":core",
    ":function",
    ":mpl",
    ":preprocessor",
    ":type_traits",
    ":typeof",
  ],
)

cc_library(
  name = "serialization",
  includes = [
    "boost/libs/serialization/include",
  ],
  hdrs = glob([
    "boost/libs/serialization/include/**/*.h",
    "boost/libs/serialization/include/**/*.hpp",
  ]),
  deps = [
    ":date_time_pool_serialization_spirit_thread",
  ]
)

cc_library(
  name = "signals",
  includes = [
    "boost/libs/signals/include",
  ],
  hdrs = glob([
    "boost/libs/signals/include/**/*.h",
    "boost/libs/signals/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/signals/src/**",
  ]),
  deps = [
    ":any",
    ":config",
    ":core",
    ":function",
    ":iterator",
    ":mpl",
    ":optional",
    ":smart_ptr",
    ":type_traits",
    ":utility",
  ],
)

cc_library(
  name = "signals2",
  includes = [
    "boost/libs/signals2/include",
  ],
  hdrs = glob([
    "boost/libs/signals2/include/**/*.h",
    "boost/libs/signals2/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/signals2/src/**",
  ]),
  deps = [
    ":assert",
    ":bind",
    ":config",
    ":core",
    ":function",
    ":iterator",
    ":mpl",
    ":multi_index",
    ":optional",
    ":parameter",
    ":predef",
    ":preprocessor",
    ":smart_ptr",
    ":throw_exception",
    ":tuple",
    ":type_traits",
    ":variant",
  ],
)

cc_library(
  name = "smart_ptr",
  includes = [
    "boost/libs/smart_ptr/include",
  ],
  hdrs = glob([
    "boost/libs/smart_ptr/include/**/*.h",
    "boost/libs/smart_ptr/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/smart_ptr/src/**",
  ]),
  deps = [
    ":align",
    ":assert",
    ":config",
    ":core",
    ":predef",
    ":throw_exception",
    ":type_traits",
  ],
)

cc_library(
  name = "sort",
  includes = [
    "boost/libs/sort/include",
  ],
  hdrs = glob([
    "boost/libs/sort/include/**/*.h",
    "boost/libs/sort/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/sort/src/**",
  ]),
  deps = [
    ":config",
    ":core",
    ":serialization",
    ":static_assert",
    ":type_traits",
  ],
)

cc_library(
  name = "spirit",
  includes = [
    "boost/libs/spirit/include",
  ],
  hdrs = glob([
    "boost/libs/spirit/include/**/*.h",
    "boost/libs/spirit/include/**/*.hpp",
  ]),
  deps = [
    ":date_time_pool_serialization_spirit_thread",
  ]
)

cc_library(
  name = "statechart",
  includes = [
    "boost/libs/statechart/include",
  ],
  hdrs = glob([
    "boost/libs/statechart/include/**/*.h",
    "boost/libs/statechart/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/statechart/src/**",
  ]),
  deps = [
    ":assert",
    ":bind",
    ":config",
    ":conversion",
    ":core",
    ":detail",
    ":function",
    ":mpl",
    ":smart_ptr",
    ":static_assert",
    ":thread",
    ":type_traits",
  ],
)

cc_library(
  name = "static_assert",
  includes = [
    "boost/libs/static_assert/include",
  ],
  hdrs = glob([
    "boost/libs/static_assert/include/**/*.h",
    "boost/libs/static_assert/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/static_assert/src/**",
  ]),
  deps = [
    ":config",
  ],
)

cc_library(
  name = "system",
  includes = [
    "boost/libs/system/include",
  ],
  hdrs = glob([
    "boost/libs/system/include/**/*.h",
    "boost/libs/system/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/system/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":core",
    ":predef",
  ],
)

cc_library(
  name = "test",
  includes = [
    "boost/libs/test/include",
  ],
  hdrs = glob([
    "boost/libs/test/include/**/*.h",
    "boost/libs/test/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/test/src/**",
  ]),
  deps = [
    ":assert",
    ":bind",
    ":config",
    ":core",
    ":detail",
    ":exception",
    ":io",
    ":iterator",
    ":lexical_cast",
    ":mpl",
    ":numeric_conversion",
    ":optional",
    ":preprocessor",
    ":smart_ptr",
    ":static_assert",
    ":timer",
    ":type_traits",
    ":utility",
  ],
)

cc_library(
  name = "thread",
  includes = [
    "boost/libs/thread/include",
  ],
  hdrs = glob([
    "boost/libs/thread/include/**/*.h",
    "boost/libs/thread/include/**/*.hpp",
  ]),
  deps = [
    ":date_time_pool_serialization_spirit_thread",
  ]
)

cc_library(
  name = "throw_exception",
  includes = [
    "boost/libs/throw_exception/include",
  ],
  hdrs = glob([
    "boost/libs/throw_exception/include/**/*.h",
    "boost/libs/throw_exception/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/throw_exception/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
  ],
)

cc_library(
  name = "timer",
  includes = [
    "boost/libs/timer/include",
  ],
  hdrs = glob([
    "boost/libs/timer/include/**/*.h",
    "boost/libs/timer/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/timer/src/**",
  ]),
  deps = [
    ":chrono",
    ":config",
    ":core",
    ":io",
    ":system",
    ":throw_exception",
  ],
)

cc_library(
  name = "tokenizer",
  includes = [
    "boost/libs/tokenizer/include",
  ],
  hdrs = glob([
    "boost/libs/tokenizer/include/**/*.h",
    "boost/libs/tokenizer/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/tokenizer/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":iterator",
    ":mpl",
    ":throw_exception",
  ],
)

cc_library(
  name = "tr1",
  includes = [
    "boost/libs/tr1/include",
  ],
  hdrs = glob([
    "boost/libs/tr1/include/**/*.h",
    "boost/libs/tr1/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/tr1/src/**",
  ]),
  deps = [
    ":array",
    ":assert",
    ":bind",
    ":config",
    ":core",
    ":function",
    ":functional",
    ":fusion",
    ":iterator",
    ":math",
    ":mpl",
    ":random",
    ":regex",
    ":smart_ptr",
    ":static_assert",
    ":tuple",
    ":type_traits",
    ":unordered",
    ":utility",
  ],
)

cc_library(
  name = "tti",
  includes = [
    "boost/libs/tti/include",
  ],
  hdrs = glob([
    "boost/libs/tti/include/**/*.h",
    "boost/libs/tti/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/tti/src/**",
  ]),
  deps = [
    ":config",
    ":function_types",
    ":mpl",
    ":preprocessor",
    ":type_traits",
  ],
)

cc_library(
  name = "tuple",
  includes = [
    "boost/libs/tuple/include",
  ],
  hdrs = glob([
    "boost/libs/tuple/include/**/*.h",
    "boost/libs/tuple/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/tuple/src/**",
  ]),
  deps = [
    ":config",
    ":core",
    ":static_assert",
    ":type_traits",
  ],
)

cc_library(
  name = "type_erasure",
  includes = [
    "boost/libs/type_erasure/include",
  ],
  hdrs = glob([
    "boost/libs/type_erasure/include/**/*.h",
    "boost/libs/type_erasure/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/type_erasure/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":core",
    ":fusion",
    ":iterator",
    ":mpl",
    ":preprocessor",
    ":smart_ptr",
    ":throw_exception",
    ":type_traits",
    ":typeof",
  ],
)

cc_library(
  name = "type_index",
  includes = [
    "boost/libs/type_index/include",
  ],
  hdrs = glob([
    "boost/libs/type_index/include/**/*.h",
    "boost/libs/type_index/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/type_index/src/**",
  ]),
  deps = [
    ":config",
    ":core",
    ":functional",
    ":mpl",
    ":preprocessor",
    ":static_assert",
    ":throw_exception",
    ":type_traits",
  ],
)

cc_library(
  name = "type_traits",
  includes = [
    "boost/libs/type_traits/include",
  ],
  hdrs = glob([
    "boost/libs/type_traits/include/**/*.h",
    "boost/libs/type_traits/include/**/*.hpp",
  ]),
  deps = [
    ":mpl_type_traits_typeof_utility",
  ]
)

cc_library(
  name = "typeof",
  includes = [
    "boost/libs/typeof/include",
  ],
  hdrs = glob([
    "boost/libs/typeof/include/**/*.h",
    "boost/libs/typeof/include/**/*.hpp",
  ]),
  deps = [
    ":mpl_type_traits_typeof_utility",
  ]
)

cc_library(
  name = "units",
  includes = [
    "boost/libs/units/include",
  ],
  hdrs = glob([
    "boost/libs/units/include/**/*.h",
    "boost/libs/units/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/units/src/**",
  ]),
  deps = [
    ":config",
    ":core",
    ":integer",
    ":io",
    ":lambda",
    ":math",
    ":mpl",
    ":preprocessor",
    ":serialization",
    ":static_assert",
    ":type_traits",
    ":typeof",
  ],
)

cc_library(
  name = "unordered",
  includes = [
    "boost/libs/unordered/include",
  ],
  hdrs = glob([
    "boost/libs/unordered/include/**/*.h",
    "boost/libs/unordered/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/unordered/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":container",
    ":core",
    ":detail",
    ":functional",
    ":iterator",
    ":move",
    ":preprocessor",
    ":smart_ptr",
    ":throw_exception",
    ":tuple",
    ":type_traits",
  ],
)

cc_library(
  name = "utility",
  includes = [
    "boost/libs/utility/include",
  ],
  hdrs = glob([
    "boost/libs/utility/include/**/*.h",
    "boost/libs/utility/include/**/*.hpp",
  ]),
  deps = [
    ":mpl_type_traits_typeof_utility",
  ]
)

cc_library(
  name = "uuid",
  includes = [
    "boost/libs/uuid/include",
  ],
  hdrs = glob([
    "boost/libs/uuid/include/**/*.h",
    "boost/libs/uuid/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/uuid/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":io",
    ":iterator",
    ":random",
    ":serialization",
    ":smart_ptr",
    ":static_assert",
    ":throw_exception",
    ":type_traits",
  ],
)

cc_library(
  name = "variant",
  includes = [
    "boost/libs/variant/include",
  ],
  hdrs = glob([
    "boost/libs/variant/include/**/*.h",
    "boost/libs/variant/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/variant/src/**",
  ]),
  deps = [
    ":assert",
    ":bind",
    ":config",
    ":core",
    ":detail",
    ":functional",
    ":math",
    ":move",
    ":mpl",
    ":preprocessor",
    ":static_assert",
    ":throw_exception",
    ":type_index",
    ":type_traits",
    ":utility",
  ],
)

cc_library(
  name = "wave",
  includes = [
    "boost/libs/wave/include",
  ],
  hdrs = glob([
    "boost/libs/wave/include/**/*.h",
    "boost/libs/wave/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/wave/src/**",
  ]),
  deps = [
    ":assert",
    ":concept_check",
    ":config",
    ":core",
    ":filesystem",
    ":iterator",
    ":mpl",
    ":multi_index",
    ":pool",
    ":preprocessor",
    ":serialization",
    ":smart_ptr",
    ":spirit",
    ":static_assert",
    ":throw_exception",
    ":type_traits",
  ],
)

cc_library(
  name = "winapi",
  includes = [
    "boost/libs/winapi/include",
  ],
  hdrs = glob([
    "boost/libs/winapi/include/**/*.h",
    "boost/libs/winapi/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/winapi/src/**",
  ]),
  deps = [
    ":config",
    ":predef",
  ],
)

cc_library(
  name = "xpressive",
  includes = [
    "boost/libs/xpressive/include",
  ],
  hdrs = glob([
    "boost/libs/xpressive/include/**/*.h",
    "boost/libs/xpressive/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/xpressive/src/**",
  ]),
  deps = [
    ":assert",
    ":config",
    ":conversion",
    ":core",
    ":exception",
    ":fusion",
    ":integer",
    ":iterator",
    ":lexical_cast",
    ":mpl",
    ":numeric_conversion",
    ":optional",
    ":preprocessor",
    ":proto",
    ":range",
    ":smart_ptr",
    ":static_assert",
    ":throw_exception",
    ":type_traits",
    ":typeof",
    ":utility",
  ],
)

cc_library(
  name = "bimap_disjoint_sets_graph_graph_parallel_mpi_parameter_property_map_python",
  includes = [
    "boost/libs/bimap/include",
    "boost/libs/disjoint_sets/include",
    "boost/libs/graph/include",
    "boost/libs/graph_parallel/include",
    "boost/libs/mpi/include",
    "boost/libs/parameter/include",
    "boost/libs/property_map/include",
    "boost/libs/python/include",
  ],
  hdrs = glob([
    "boost/libs/bimap/include/**/*.h",
    "boost/libs/bimap/include/**/*.hpp",
    "boost/libs/disjoint_sets/include/**/*.h",
    "boost/libs/disjoint_sets/include/**/*.hpp",
    "boost/libs/graph/include/**/*.h",
    "boost/libs/graph/include/**/*.hpp",
    "boost/libs/graph_parallel/include/**/*.h",
    "boost/libs/graph_parallel/include/**/*.hpp",
    "boost/libs/mpi/include/**/*.h",
    "boost/libs/mpi/include/**/*.hpp",
    "boost/libs/parameter/include/**/*.h",
    "boost/libs/parameter/include/**/*.hpp",
    "boost/libs/property_map/include/**/*.h",
    "boost/libs/property_map/include/**/*.hpp",
    "boost/libs/python/include/**/*.h",
    "boost/libs/python/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/bimap/src/**",
    "boost/libs/disjoint_sets/src/**",
    "boost/libs/graph/src/**",
    "boost/libs/graph_parallel/src/**",
    "boost/libs/mpi/src/**",
    "boost/libs/parameter/src/**",
    "boost/libs/property_map/src/**",
    "boost/libs/python/src/**",
  ]),
  deps = [
    ":algorithm",
    ":any",
    ":array",
    ":assert",
    ":bind",
    ":concept_check",
    ":config",
    ":conversion",
    ":core",
    ":detail",
    ":dynamic_bitset",
    ":filesystem",
    ":foreach",
    ":function",
    ":functional",
    ":integer",
    ":iterator",
    ":lambda",
    ":lexical_cast",
    ":math",
    ":move",
    ":mpl",
    ":multi_index",
    ":numeric_conversion",
    ":optional",
    ":preprocessor",
    ":property_tree",
    ":random",
    ":range",
    ":regex",
    ":serialization",
    ":smart_ptr",
    ":spirit",
    ":static_assert",
    ":test",
    ":throw_exception",
    ":tti",
    ":tuple",
    ":type_traits",
    ":typeof",
    ":unordered",
    ":utility",
    ":variant",
    ":xpressive",
  ],
  visibility = [
    "//visibility:private",
  ],
)

cc_library(
  name = "date_time_pool_serialization_spirit_thread",
  includes = [
    "boost/libs/date_time/include",
    "boost/libs/pool/include",
    "boost/libs/serialization/include",
    "boost/libs/spirit/include",
    "boost/libs/thread/include",
  ],
  hdrs = glob([
    "boost/libs/date_time/include/**/*.h",
    "boost/libs/date_time/include/**/*.hpp",
    "boost/libs/pool/include/**/*.h",
    "boost/libs/pool/include/**/*.hpp",
    "boost/libs/serialization/include/**/*.h",
    "boost/libs/serialization/include/**/*.hpp",
    "boost/libs/spirit/include/**/*.h",
    "boost/libs/spirit/include/**/*.hpp",
    "boost/libs/thread/include/**/*.h",
    "boost/libs/thread/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/date_time/src/**",
    "boost/libs/pool/src/**",
    "boost/libs/serialization/src/**",
    "boost/libs/spirit/src/**",
    "boost/libs/thread/src/**",
  ]),
  deps = [
    ":algorithm",
    ":array",
    ":assert",
    ":atomic",
    ":bind",
    ":chrono",
    ":concept_check",
    ":config",
    ":container",
    ":core",
    ":detail",
    ":exception",
    ":filesystem",
    ":foreach",
    ":function",
    ":function_types",
    ":functional",
    ":fusion",
    ":integer",
    ":intrusive",
    ":io",
    ":iostreams",
    ":iterator",
    ":lexical_cast",
    ":math",
    ":move",
    ":mpl",
    ":optional",
    ":phoenix",
    ":predef",
    ":preprocessor",
    ":proto",
    ":range",
    ":regex",
    ":smart_ptr",
    ":static_assert",
    ":system",
    ":throw_exception",
    ":tokenizer",
    ":tuple",
    ":type_traits",
    ":typeof",
    ":unordered",
    ":utility",
    ":variant",
    ":winapi",
  ],
  visibility = [
    "//visibility:private",
  ],
)

cc_library(
  name = "lexical_cast_math",
  includes = [
    "boost/libs/lexical_cast/include",
    "boost/libs/math/include",
  ],
  hdrs = glob([
    "boost/libs/lexical_cast/include/**/*.h",
    "boost/libs/lexical_cast/include/**/*.hpp",
    "boost/libs/math/include/**/*.h",
    "boost/libs/math/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/lexical_cast/src/**",
    "boost/libs/math/src/**",
  ]),
  deps = [
    ":array",
    ":assert",
    ":atomic",
    ":concept_check",
    ":config",
    ":container",
    ":core",
    ":detail",
    ":format",
    ":fusion",
    ":integer",
    ":mpl",
    ":numeric_conversion",
    ":predef",
    ":range",
    ":smart_ptr",
    ":static_assert",
    ":throw_exception",
    ":tuple",
    ":type_traits",
  ],
  visibility = [
    "//visibility:private",
  ],
)

cc_library(
  name = "mpl_type_traits_typeof_utility",
  includes = [
    "boost/libs/mpl/include",
    "boost/libs/type_traits/include",
    "boost/libs/typeof/include",
    "boost/libs/utility/include",
  ],
  hdrs = glob([
    "boost/libs/mpl/include/**/*.h",
    "boost/libs/mpl/include/**/*.hpp",
    "boost/libs/type_traits/include/**/*.h",
    "boost/libs/type_traits/include/**/*.hpp",
    "boost/libs/typeof/include/**/*.h",
    "boost/libs/typeof/include/**/*.hpp",
    "boost/libs/utility/include/**/*.h",
    "boost/libs/utility/include/**/*.hpp",
  ]),
  srcs = glob([
    "boost/libs/mpl/src/**",
    "boost/libs/type_traits/src/**",
    "boost/libs/typeof/src/**",
    "boost/libs/utility/src/**",
  ]),
  deps = [
    ":config",
    ":core",
    ":predef",
    ":preprocessor",
    ":static_assert",
    ":throw_exception",
  ],
  visibility = [
    "//visibility:private",
  ],
)

