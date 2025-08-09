const expect = @import("std").testing.expect;

const Result = union {
    int: i64,
    float: f64,
    bool: bool,
};

test "simple union" {
    var result = Result{ .int = 1234 };
    // result.float = 12.34; // illegal behaviour: access of union field 'float' while field 'int' is active
    result.int = 10;
}

const Tag = enum { a, b, c };
const Tagged = union(Tag) { a: u8, b: f32, c: bool };

test "switch on tagged union" {
    var value = Tagged{ .b = 1.5 };
    switch (value) {
        .a => |*byte| byte.* += 1,
        .b => |*float| float.* *= 2,
        .c => |*b| b.* = !b.*,
    }
    try expect(value.b == 3);
}

const Tagged2 = union(enum) { a: u8, b: f32, c: bool, none };

test "inferred union tag type" {
    const value = Tagged2{ .c = true };
    try expect(@TypeOf(value.c) == bool);
}
