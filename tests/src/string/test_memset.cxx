#include <gtest/gtest.h>
#include <cstdlib>

#include "syslibc_string.h"

TEST(String, Memset)
{
	char* s = (char*)malloc(5);
	s[4] = '\0';
	char* t = (char*)syslibc_memset(s, 'a', 4);
	EXPECT_EQ(t[0], 'a');
	EXPECT_EQ(t[1], 'a');
	EXPECT_EQ(t[2], 'a');
	EXPECT_EQ(t[3], 'a');
	EXPECT_EQ(t[4], '\0');
	EXPECT_EQ(syslibc_strlen(t), 4);
	free(s);

	int* ptr = (int*)malloc(sizeof(int) * 10);
	syslibc_memset(ptr, 100, 10);
	char* cptr = (char*)ptr;
	for (size_t i = 0; i < 10; ++i)
	{
		EXPECT_EQ(cptr[i], 100);
	}
	free(ptr);
}
