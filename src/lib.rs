#![feature(wasm_import_memory)]

#![wasm_import_memory]

#[no_mangle]
pub extern "C" fn transform(arlen: i32, ar: *mut u8) -> i32 {
    const ICHAR: u8 = 105;
    const OCHAR: u8 = 111;

    for i in 0..arlen as usize {
      unsafe { if *ar.offset(i as isize) == ICHAR { *ar.offset(i as isize) = OCHAR; } }
    }
    return arlen;
}


