const std = @import("std");
const expect = @import("std").testing.expect;

const FileOpenError = error{ // this like an enum?
    AccessDenied, // what kind of "value" are these errors? e.g. what kind of bytes are actually behind this construct?
    OutOfMemory,
    FileNotFound,
};

const AllocationError = error{OutOfMemory}; // i dont really get the point of this yet, why is this useful/where should something like this be used?
                                            // Update: i get it, OutOutMemory can also have a OutOfMemory error, so we can put OutOfMemory from FileOpenError into AllocationError
test "coerce error from a subset to a superset" {
    const err: FileOpenError = AllocationError.OutOfMemory;
    try expect(err == FileOpenError.OutOfMemory);
}

test "error union" {
    const maybe_error: AllocationError!u16 = 10; // maybe_error could be an error of type AllocationError (OutOfMemory) or be a u16 = 10
    const no_error = maybe_error catch 0; // no_error catches if maybe_error is an error and assigns a standard value of 0 if thats the case otherwise assign it to value of maybe_error

    try expect(@TypeOf(no_error) == u16); // no error should be of type u16 because we catched the error and assigned a standard value if an error occured
    try expect(no_error == 10); // no_error should take the value of maybe_error because no error should occur assigning the constant?
}

fn failingFunction() error{Oops}!void{ // a function that can either return void or an error Oops
    return error.Oops; // always returns the error Oops
}

test "returning an error" {
    failingFunction() catch |err| { // call the function and catch the error to variable "err" ?
        try expect(err == error.Oops);
        return;
    };
}

fn failFn() error{Oops}!i32 {
    try failingFunction(); // this catches the error Oops created in failingFunction
    return 12;
}

// try and catch are not the same as in other languages. try is a shorthand for fn catch |err| return err;
test "try" {
    const v = failFn() catch |err| {
        try expect(err == error.Oops);
        return;
    };
    try expect(v == 12); // v cant be 12 because failFn returns the error from failingFunction
}
