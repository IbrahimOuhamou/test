//in the name of Allah
//la ilaha illa Allah Mohammed Rassoul Allah
const std = @import("std");

pub fn main() !void {
    std.debug.print("in the name of Allah\n", .{});
}

test "ArrayList" {
    var bismi_allah = std.ArrayList(usize).init(std.testing.allocator);
    try bismi_allah.append(12);
    try bismi_allah.append(12);
    try bismi_allah.append(12);
    try bismi_allah.append(12);
    try bismi_allah.append(12);
    std.debug.print("alhamdo li Allah : '{any}'", .{bismi_allah.items});
    bismi_allah.deinit();
}

