[CCode (cheader_filename = "libctrl.h")]
namespace ValaTest {
    [CCode (cname = "TestType", has_type_id = false)]
    public struct TestType {
        public int int1;
        public uint8 int2;
    }

    [CCode (cname = "test")]
    public void test (uint[] slice, TestType testType);
}
