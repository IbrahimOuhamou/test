//بسم الله الرحمن الرحيم
//la ilaha illa Allah mohammed rassoul Allah
const std = @import("std");
const expect = std.testing.expect;

pub fn main() !void {
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();
    try stdout.print("بسم الله الرحمن الرحيم\n", .{});

    var bismi_allah_arr: ?[]u8 = null;
    try stdout.print("alhamdo li Allah bismi_allah_arr.len == {d}\n", .{if (null != bismi_allah_arr) bismi_allah_arr.?.len else 0});
    var bismi_allah = [2]u8{ 12, 13 };
    bismi_allah_arr = bismi_allah[0..];
    try stdout.print("alhamdo li Allah bismi_allah_arr.len == {d}\n", .{bismi_allah_arr.?.len});

    for (bismi_allah_arr.?) |value| {
        try stdout.print("bismi_allah_arr[i] == '{d}'\n", .{value});
    }
    std.debug.print("{}\n", .{bismi_allah_arr.?[0]});

    try bw.flush(); // don't forget to flush!
}

test "bismi_allah: []?*BismiAllah" {
    const BismiAllah = struct {
        id: usize,
    };

    var bismi_allah1 = BismiAllah{ .id = 1 };
    var bismi_allah2 = BismiAllah{ .id = 2 };
    var bismi_allah3 = BismiAllah{ .id = 3 };
    var bismi_allah4 = BismiAllah{ .id = 4 };

    var bismi_allah_arr: ?[]?*BismiAllah = null;
    bismi_allah_arr = try std.testing.allocator.alloc(?*BismiAllah, 4);
    bismi_allah_arr.?[0] = &bismi_allah1;
    bismi_allah_arr.?[1] = &bismi_allah2;
    bismi_allah_arr.?[2] = &bismi_allah3;
    bismi_allah_arr.?[3] = &bismi_allah4;

    for (bismi_allah_arr.?, 0..) |bismi_allah, i| {
        bismi_allah.?.id = i;
    }

    std.testing.allocator.free(bismi_allah_arr.?);
    //const result = std.testing.allocator.free(bismi_allah_arr.?.ptr);
}

test "bismi_allah: opt_arr" {
    var bismi_allah1: usize = 1;
    var bismi_allah2: usize = 2;
    var bismi_allah3: usize = 3;
    var bismi_allah4: usize = 4;
    var bismi_allah_arr: ?[]const ?*usize = null;
    bismi_allah_arr = &[_]?*usize{ &bismi_allah1, &bismi_allah2, &bismi_allah3, &bismi_allah4 };
    try expect(bismi_allah_arr.?[0] != null);
}

test "bismi_llah: slices_arr" {
    const bismi_allah = "بسم الله الرحمن الرحيم";
    const shahada = "la ilaha illa Allah Mohammed Rassoul Allah";

    var arr: [2][]const u8 = undefined;
    arr[0] = bismi_allah;
    arr[1] = shahada;

    try (expect(std.mem.eql(u8, bismi_allah, arr[0])));
}
