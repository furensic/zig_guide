const expect = @import("std").testing.expect;

test "nested continue" {
    var count: usize = 0;
    outer: for ([_]i32{ 1, 2, 3, 4, 5, 6, 7, 8 }) |_| {
        for ([_]i32{ 1, 2, 3, 4, 5 }) |_| {
            count += 1;
            continue :outer;
        }
    }
    try expect(count == 8);
}

// outer:   inner: count:
// 1        1      1
// 2        1      2
// 3        1      3
// 4        1      4
// 5        1      5
// 6        1      6
// 7        1      7
// 8        1      8
