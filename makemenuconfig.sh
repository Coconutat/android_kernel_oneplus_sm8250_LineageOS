#!/bin/bash
#设置环境

# 交叉编译器路径
export PATH=$PATH:$(pwd)/../Compiler/Zyc_Clang_16/bin
export CC=clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=arm-linux-gnueabi-
# export CROSS_COMPILE_COMPAT=arm-linux-gnueabi-
# export CONFIG_BUILD_ARM64_DT_OVERLAY=y

export ARCH=arm64
# export DTC_EXT=dtc

# ccache
export PATH="/usr/lib/ccache:$PATH"

if [ ! -d "out" ]; then
	mkdir out
fi

start_time=$(date +%Y.%m.%d-%I_%M)

start_time_sum=$(date +%s)

make ARCH=arm64 O=out CC="ccache clang" vendor/kona-perf_defconfig vendor/oplus.config vendor/resuksisu.config
make ARCH=arm64 O=out CC="ccache clang" menuconfig