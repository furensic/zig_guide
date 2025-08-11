const expect = @import("std").testing.expect;

fn rangeHasNumber(begin: usize, end: usize, number: usize) bool {
    var i = begin;
    return while (i < end) : (i += 1) {
        if (i == number) {
            break true;
        }
    } else false; // Loops in Zig also have an else branch, which is evaluated when the loop is not exited with a break
}

test "while loop expression" {
    try expect(rangeHasNumber(0, 10, 3));
}
