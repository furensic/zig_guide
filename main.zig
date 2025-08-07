const std = @import("std");
const expect = @import("std").testing.expect;
pub fn main() void {
    std.debug.print("Hello, {s}!\n", .{"World!"});

    //-- Assignment
    const contstant: i32 = 5; // signed 32-bit constant
    const variable: u32 = 5000; // unsigned 32-bit variable
    _ = contstant + variable; // _ = var discard the variable, this prevents compiler errors if a variable is unused

    // @as performs an explicit type coercion
    const inferred_constant = @as(i32, 5);
    const inferred_variable = @as(u32, 5000);
    _ = inferred_constant + inferred_variable;

    //-- Arrays
    const a = [5]u8{ 'h', 'e', 'l', 'l', 'o' }; // Array of type 8-bit unsigned integer with size of 5
    const b = [_]u8{ 'w', 'o', 'r', 'l', 'd' }; // Array of type 8-bit unsigned interger with inferred size
    const length = a.len; // Length of array a (5)
    _ = b;
    _ = length;
}

//- Functions
fn addFive(x: u32) u32 {
    return x + 5;
}

test "function" {
    const y = addFive(0);
    try expect(@TypeOf(y) == u32); // test if function returns type u32
    try expect(y == 5); // test if function returns 0 + 5 = 5
}

// todo: i cant do recursion in my head
fn fibonacci(n: u16) u16 {
    if (n == 0 or n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
}

test "function recursion" {
    const x = fibonacci(10);
    try expect(x == 55);
}
