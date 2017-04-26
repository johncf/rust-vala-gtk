#ifndef LIBCTRL_H_
#define LIBCTRL_H_

typedef struct TestType {
    int int1;
    unsigned char int2;
} TestType;

void test(unsigned int slice[], int slice_length, TestType *test_type);

#endif
