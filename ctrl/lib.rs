#[repr(C)]
#[derive(Debug)]
pub struct TestType {
    int1: i32,
    int2: u8,
}

#[no_mangle]
pub extern fn test(slice: &[u32], test_type: &TestType) {
    for element in slice {
        println!("slice: {}", element);
    }

    println!("TestType: {:?}", test_type);
}
