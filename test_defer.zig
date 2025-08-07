const expect = @import("std").testing.expect;

test "defer" {
    var x: i16 = 5;
    {
        defer x += 2;
        try expect(x == 5); // defer is only being run after the current BLOCK so x is still 5
    }
    try expect(x == 7); // defer was being run meaning x = 5 + 2 = 7
}

test "multiple defers" {
    var x: f32 = 5;
    {
        // defer runs in reverse order. so 5 / 2 = 2.5 + 2 = 4.5
        defer x += 2;
        defer x /= 2;
    }
    try expect(x == 4.5);
}
