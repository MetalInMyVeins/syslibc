LIB_OBJS_TEST := $(patsubst src/%.asm,$(BUILD)/lib_test/%.o,$(LIB_SRCS))

$(BUILD)/lib_test/%.o: src/%.asm
	@mkdir -p $(@D)
	$(ASM) $(AFLAGS_DEB) $(AFLAGS_TESTING) -MD $(@:.o=.d) -MP $< -o $@

-include $(LIB_OBJS_TEST:.o=.d)

LIB_A_TEST := $(BUILD)/lib/libsyslibc_test.a

$(LIB_A_TEST): $(LIB_OBJS_TEST)
	@mkdir -p $(@D)
	rm -f $@
	$(AR) rcs $@ $^

TEST_SRCS  := $(shell find tests -name 'test_*.cxx')
TEST_NAMES := $(basename $(notdir $(TEST_SRCS)))

BUILD_TESTS := $(addprefix $(BUILD)/tests/,$(TEST_NAMES))

define TEST_template
$(BUILD)/tests/$(2): $(1) $(LIB_A_TEST)
	@mkdir -p $$(@D)
	$$(CXX) $$(CXXFLAGS) $(1) $$(LIB_A_TEST) $$(GTEST_LIBS) -o $$@
endef
$(foreach src,$(TEST_SRCS),$(eval $(call TEST_template,$(src),$(basename $(notdir $(src))))))

.PHONY: $(TEST_NAMES) tests
$(TEST_NAMES): %: $(BUILD)/tests/%
tests: $(BUILD_TESTS)

TEST_ALL_BIN := $(BUILD)/tests/test_all

$(TEST_ALL_BIN): $(TEST_SRCS) $(LIB_A_TEST)
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) $(TEST_SRCS) $(LIB_A_TEST) $(GTEST_LIBS) -o $@

.PHONY: test_all check
test_all: $(TEST_ALL_BIN)

check: $(TEST_ALL_BIN)
	$(TEST_ALL_BIN)
