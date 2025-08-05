const std = @import("std");

pub fn main() void {
    std.debug.print("Hello, {s}!\n", .{"World!"});

    //-- Assignment
    const contstant: i32 = 5; // signed 32-bit constant
    const variable: u32 = 5000; // unsigned 32-bit variable

    // @as performs an explicit type coercion
    const inferred_constant = @as(i32, 5);
    const inferred_variable = @as(u32, 5000);

    //-- Arrays
    const a = [5]u8{ 'h', 'e', 'l', 'l', 'o' }; // Array of type 8-bit unsigned integer with size of 5
    const b = [_]u8{ 'w', 'o', 'r', 'l', 'd' }; // Array of type 8-bit unsigned interger with inferred size
    const length = a.len; // Length of array a (5)
}
