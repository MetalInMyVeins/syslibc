CC := clang
CXX := clang++
LD := ld.lld
AR := llvm-ar
ASM := nasm
STRIP := strip

CFLAGS := \
	-g \
	-std=c23 \
	-Wall -Wextra -Werror \
	-ffreestanding \
	-fno-builtin \
	-nostdinc \
	-fno-stack-protector \
	-fuse-ld=lld \
	-Iinclude

CXXFLAGS := \
	-std=c++23 \
	-pthread \
	-Itests/include/

LDFLAGS := \
	-nostdlib

STATIC := \
	-static

GTEST_LIBS := \
	-lgtest \
	-lgtest_main \
	-pthread

AFLAGS_DEB := \
	-f elf64 \
	-g \
	-F dwarf

AFLAGS_REL := \
	-f \
	elf64

AFLAGS_TESTING := \
	-DTESTING

BUILD := build

include mk/startup.mk
include mk/lib.mk
include mk/debug.mk
include mk/tests.mk

.PHONY: clean
clean:
	rm -rf .cache/
	rm -rf build/
	find . -name "*.o" -delete
	rm -f compile_commands.json
