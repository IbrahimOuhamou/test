//بسم الله الرحمن الرحيم
//la ilaha illa Allah mohammed rassoul Allah
const std = @import("std");

const BismiAllah = struct {
    name: ?[]u8,
};

pub fn main() !void {
    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();
    try stdout.print("la ilaha illa Allah mohammed rassoul Allah\n", .{});

    const bismi_allah = BismiAllah{ .name="bismi_allah"};
    try stdout.print("bismi_allah.name = '{s}'\n", bismi_allah.name);

    try bw.flush(); // don't forget to flush!
}

