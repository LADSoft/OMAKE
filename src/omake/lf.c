#include <stdio.h>

main(int argc, char **argv)
{
    FILE *in, *out;
    int vv;
    if (argc == 3)
    {
        in = fopen(argv[1], "rb");
        out = fopen(argv[2], "w");
        while ((vv = fgetc(in)) != -1)
            fputc(vv, out);
        fclose(out);
        fclose(in);
    }
}