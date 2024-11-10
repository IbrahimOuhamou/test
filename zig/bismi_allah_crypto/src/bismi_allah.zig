// بسم الله الرحمن الرحيم
// la ilaha illa Allah Mohammed rassoul Allah
const std = @import("std");

pub fn main() !void {
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    _ = try stdout.write("بسم الله الرحمن الرحيم\n");

    _ = try stdout.write("will generate csrf token thanks to Allah\n");

    var bismi_allah_token_buffer_raw: [42]u8 = undefined;
    std.crypto.random.bytes(&bismi_allah_token_buffer_raw);

    var bismi_allah_token_buffer_u64: [std.base64.url_safe.Encoder.calcSize(bismi_allah_token_buffer_raw.len)]u8 = undefined;
    const bismi_allah_token_slice = std.base64.url_safe.Encoder.encode(&bismi_allah_token_buffer_u64, &bismi_allah_token_buffer_raw);

    try stdout.print("alhamdo li Allah token: '{s}'\n", .{bismi_allah_token_slice});
    try stdout.print("alhamdo li Allah size of u64: '{d}'\n", .{bismi_allah_token_buffer_u64.len});

    try bw.flush(); // don't forget to flush!
}
