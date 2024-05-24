//بسم الله الرحمن الرحيم
//la ilaha illa Allah Mohammed Rassoul Allah
const std = @import("std");

pub fn main() !void {
    std.debug.print("بسم الله الرحمن الرحيم\n", .{});
    var val: u32 = 12;
    bismi_allah(&val);
}


fn bismi_allah(ptr: *const u32) void {
    ptr.* = 9;
}

