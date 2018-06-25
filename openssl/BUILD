package(default_visibility = ["//visibility:private"])

CFLAGS = [
    "-DZLIB",
    "-DDSO_DLFCN",
    "-DHAVE_DLFCN_H",
    "-DOPENSSL_THREADS",
    "-DOPENSSL_NO_DYNAMIC_ENGINE",
    "-DOPENSSL_PIC",
    "-DOPENSSL_IA32_SSE2",
    "-DOPENSSL_BN_ASM_MONT",
    "-DOPENSSL_BN_ASM_MONT5",
    "-DOPENSSL_BN_ASM_GF2m",
    "-DSHA1_ASM",
    "-DSHA256_ASM",
    "-DSHA512_ASM",
    "-DRC4_ASM",
    "-DMD5_ASM",
    "-DAES_ASM",
    "-DVPAES_ASM",
    "-DBSAES_ASM",
    "-DGHASH_ASM",
    "-DECP_NISTZ256_ASM",
    "-DPADLOCK_ASM",
    "-DPOLY1305_ASM",
] + select({
    "@bazel_shared//tools/target_cpu:piii": [

    ],
    "@bazel_shared//tools/target_cpu:k8": [

    ],
    "@bazel_shared//tools/target_cpu:": [

    ],
})
