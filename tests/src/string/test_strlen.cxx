#include <gtest/gtest.h>
#include <cstdlib>

#include "syslibc_string.h"

TEST(String, Strlen)
{
	const char* s = "asdf";
	EXPECT_EQ(syslibc_strlen(s), 4UL);

	char* p = (char*)malloc(11);
	p[0] = 'k';
	p[1] = 'c';
	p[2] = 'u';
	p[3] = 'f';
	p[4] = 'l';
	p[5] = 'e';
	p[6] = 'a';
	p[7] = 'r';
	p[8] = 's';
	p[9] = 'i';
	p[10] = '\0';
	EXPECT_EQ(syslibc_strlen(p), 10UL);
	free(p);
}
