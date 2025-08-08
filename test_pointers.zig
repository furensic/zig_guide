const expect = @import("std").testing.expect;

test "usize" {
    try expect(@sizeOf(usize) == @sizeOf(*u8)); // not sure where this could be used?
    try expect(@sizeOf(isize) == @sizeOf(*u8));
}
