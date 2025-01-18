// بسم الله الرحمن الرحيم
// la ilaha illa Allah Mohammed Rassoul Allah

const std = @import("std");

const BismiAllahEnum = enum {
    bismi_allah1,
    bismi_allah2,
};

pub fn main() !void {
    std.debug.print("بسم الله الرحمن الرحيم\n", .{});

    inline for (@typeInfo(BismiAllahEnum).@"enum".fields) |field| {
        std.debug.print("alhamdo li Allah: '{s}': '{d}'\n", .{ field.name, field.value });
        const bismi_allah: BismiAllahEnum = @enumFromInt(field.value);
        std.debug.print("alhamdo li Allah enum: '{any}'\n", .{bismi_allah});
    }
}
