//بسم الله الرحمن الرحيم
//la ilaha illa Allah mohammed rassoul Allah
const std = @import("std");

pub fn main() !void {
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();
    try stdout.print("بسم الله الرحمن الرحيم\n", .{});

    var bismi_allah_arr: ?[]u8 = null;
    try stdout.print("alhamdo li Allah bismi_allah_arr.len == {d}\n", .{if(null != bismi_allah_arr) bismi_allah_arr.?.len else 0});
    var bismi_allah = [2]u8{12, 13};
    bismi_allah_arr = bismi_allah[0..];
    try stdout.print("alhamdo li Allah bismi_allah_arr.len == {d}\n", .{bismi_allah_arr.?.len});

    for (bismi_allah_arr.?) |value| {
        try stdout.print("bismi_allah_arr[i] == '{d}'\n", .{value});
    }
    std.debug.print("{}\n", .{bismi_allah_arr.?[0]});

    try bw.flush(); // don't forget to flush!
}
