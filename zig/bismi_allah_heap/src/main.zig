//in the name of Allah
//la ilaha illa Allah Mohammed Rassoul Allah
const std = @import("std");

pub fn main() !void {
    std.debug.print("in the name of Allah\n", .{});

}

test "bismi_allah initialize struct in heap" {
    const allocator = std.testing.allocator;
    const BismiAllah = struct { id: u8 = 12, };
    const bismi_allah: *BismiAllah = try allocator.create(BismiAllah);
    bismi_allah.* = BismiAllah{};
    try std.testing.expect(12 == bismi_allah.id);
    allocator.destroy(bismi_allah);
}

