using ValaTest;

void main (string[] args) {
    TestType testType = { 123456789, 255 };

    uint[] slice = { 1, 2, 255 };

    test (slice, testType);
}
