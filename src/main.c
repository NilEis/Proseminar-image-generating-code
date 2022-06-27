#include <stdio.h>

int main(int argc, char const *argv[])
{
	printf("P2\n256 256\n255\n");
	for (int y = 0; y < 256; y++)
	{
		for (int x = 0; x < 256; x++)
		{
			printf("%d ", (x ^ y));
		}
		printf("\n");
	}
}
