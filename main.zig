const std = @import("std");

pub fn main() void {
    std.debug.print("Hello, {s}!\n", .{"World!"});

    //-- Assignment
    const contstant: i32 = 5; // signed 32-bit constant
    const variable: u32 = 5000; // unsigned 32-bit variable

    // @as performs an explicit type coercion
    const inferred_constant = @as(i32, 5);
    const inferred_variable = @as(u32, 5000);
}
