const expect = @import("std").testing.expect;

test "switch statement" {
    var x: i8 = 10;
    switch (x) {
        -1...1 => {
            x = -x;
        },
        10, 100 => {
            x = @divExact(x, 10); // i dont understand why this is needed?
        },
        else => {},
    }
    try expect(x == 1);
}

test "switch expression" {
    var x: i8 = 10;
    x = switch (x) {
        -1...1 => -x,
        10, 100 => @divExact(x, 10), // interesting, i can assign x with the value that is being returned from the switch expression, looks a lot like F#
        else => x,
    };
    try expect(x == 1);
}
