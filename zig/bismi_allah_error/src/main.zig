//بسم الله الرحمن الرحيم
//la ilaha illa Allah Mohammed Rassoul Allah
const std = @import("std");

pub fn main() !void {
    std.debug.print("la ilaha illa Allah Mohammed Rassoul Allah\n", .{});
}

const Error = error { BadError };
fn bismi_allah_bool(b: u8) Error!bool {
    if(0 == b) return true;
    if(1 == b) return false;
    return Error.BadError;
}

test "bismi_allah !bool" {
    if(bismi_allah_bool(2)) |result| {
        if (result) {
            std.debug.print("alhamdo li Allah true\n", .{});
        } else {
            std.debug.print("alhamdo li Allah false\n", .{});
        }
    } else |e| {
        std.debug.print("alhamdo li Allah Error {any}\n", .{e});
    }
}

