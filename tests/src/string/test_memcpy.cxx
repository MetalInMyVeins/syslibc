#include <gtest/gtest.h>
#include <cstdlib>

#include "syslibc_string.h"

TEST(String, Memcpy)
{
	const char* s1 = "asdfghij";
	char* s2 = (char*)malloc(5);
	s2[4] = '\0';
	const char* t = (const char*)syslibc_memcpy((void*)s2, (void*)s1, 4);
	EXPECT_EQ(t[0], 'a');
	EXPECT_EQ(t[1], 's');
	EXPECT_EQ(t[2], 'd');
	EXPECT_EQ(t[3], 'f');
	EXPECT_EQ(t[4], '\0');
	EXPECT_EQ(syslibc_strlen(t), 4);
}
