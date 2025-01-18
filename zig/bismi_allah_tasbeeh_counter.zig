// بسم الله الرحمن الرحيم
// la ilaha illa Allah Mohammed Rassoul Allah

const std = @import("std");

var buffer_input_dikr: [100]u8 = undefined;
var buffer_input_count: [4]u8 = undefined;
var tmp_buffer: [1]u8 = undefined;

pub fn main() !void {
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();
    const stdin = std.io.getStdIn();

    defer {
        bw.flush() catch |err| std.log.err("alhamdo li Allah error: '{any}'\n", .{err});
    }

    try stdout.writeAll("بسم الله الرحمن الرحيم\nenter the dikr you want to repeat: ");
    try bw.flush(); // don't forget to flush!

    const dikr_slice = buffer_input_dikr[0 .. try stdin.read(&buffer_input_dikr) - 1];

    try stdout.writeAll("enter number of times to repeat: ");
    try bw.flush(); // don't forget to flush!

    const count_slice = buffer_input_count[0 .. try stdin.read(&buffer_input_count) - 1];
    const count = try std.fmt.parseInt(u16, count_slice, 10);
    try bw.flush(); // don't forget to flush!

    var i: u16 = 0;
    while (i < count) : (i += 1) {
        try stdout.print("{d} {s}", .{ i, dikr_slice });
        try bw.flush();
        _ = try stdin.readAll(&tmp_buffer);
    }
}
