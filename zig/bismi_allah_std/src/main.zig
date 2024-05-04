//in the name of Allah
//la ilaha illa Allah Mohammed Rassoul Allah
const std = @import("std");

pub fn main() !void {
    std.debug.print("in the name of Allah\n", .{});
}

test "ArrayList" {
    var bismi_allah = std.ArrayList(usize).init(std.testing.allocator);
    defer bismi_allah.deinit();
    try bismi_allah.append(12);
    try bismi_allah.append(12);
    try bismi_allah.append(12);
    try bismi_allah.append(12);
    try bismi_allah.append(12);

    const BismiAllah = struct { id: usize };
    var bismi_allah_list = std.ArrayList(BismiAllah).init(std.testing.allocator);
    defer bismi_allah_list.deinit();
    try bismi_allah_list.append(BismiAllah{.id=12});
    std.debug.print("alhamdo li Allah : '{any}'", .{bismi_allah_list.items});
}

