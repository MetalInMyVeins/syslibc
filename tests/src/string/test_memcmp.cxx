#include <gtest/gtest.h>

#include "syslibc_string.h"

TEST(String, Memcmp)
{
	const char* s1 = "app";
	const char* s2 = "aapkl";
	int x = memcmp(s1, s2, 3);
	int y = syslibc_memcmp(s1, s2, 3);
	EXPECT_EQ(x, y);
	x = memcmp(s2, s1, 5);
	y = syslibc_memcmp(s2, s1, 5);
	EXPECT_EQ(x, y);
}
