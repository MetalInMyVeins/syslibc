#include <gtest/gtest.h>
#include <cstdlib>

extern "C" unsigned long syslibc_strlen(const char*);

TEST(String, Strlen)
{
	const char* s = "asdf";
	EXPECT_EQ(syslibc_strlen(s), 4UL);

	char* p = (char*)malloc(11);
	p[0] = 'f';
	p[1] = 'u';
	p[2] = 'c';
	p[3] = 'k';
	p[4] = 'i';
	p[5] = 's';
	p[6] = 'r';
	p[7] = 'a';
	p[8] = 'e';
	p[9] = 'l';
	p[10] = '\0';
	EXPECT_EQ(syslibc_strlen(p), 10UL);
	free(p);
}
