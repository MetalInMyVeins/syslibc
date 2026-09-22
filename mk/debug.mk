DEBUG_SRCS  := $(wildcard debug/dbg_*.c)
DEBUG_PROGS := $(basename $(notdir $(DEBUG_SRCS)))

$(BUILD)/debug/%: debug/%.c $(CRT_DEB) $(LIB_A_DEB)
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) $(LDFLAGS) $(STATIC) $(CRT_DEB) $< $(LIB_A_DEB) -o $@

.PHONY: $(DEBUG_PROGS) debug_all
$(DEBUG_PROGS): %: $(BUILD)/debug/%
debug_all: $(addprefix $(BUILD)/debug/,$(DEBUG_PROGS))
