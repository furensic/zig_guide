const std = @import("std");
const expect = std.testing.expect;

// some of my own tests
fn inspectFloatAsBits(value: f32) void {
    const bitcast: u32 = @bitCast(value);
    std.debug.print("Bits: {b}\n", .{bitcast});
}

test "inspect bits of float32" {
    const value: f32 = -123.456e-10;
    inspectFloatAsBits(value);
    try expect(@TypeOf(value) == f32);
}
