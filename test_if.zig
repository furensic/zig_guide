const expect = @import("std").testing.expect;

test "if statement" {
    const a = true;
    var x: u16 = 0;
    if (a) {
        x += 1;
    } else {
        x += 2;
    }

    try expect(x == 1);
}

test "if statement expression" {
    const a = true;
    var x: u16 = 0;
    x += if (a) 1 else 2;
    try expect(x == 1);
}

test "test if with multiple conditions" {
    const is_true: bool = true;
    const number: i32 = 10;
    if (number == 10 and is_true == true) { // interesting, && doesn't work
        try expect(true);
    } else {
        try expect(false);
    }
}
