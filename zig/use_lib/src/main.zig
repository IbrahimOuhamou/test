//بسم الله الرحمن الرحيم
//la ilaha illa Allah mohammed rassoul Allah
const std = @import("std");
const task_tree_lib = @import("task_tree");

pub fn main() !void {
    // Prints to stderr (it's a shortcut based on `std.io.getStdErr()`)

    // stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("بسم الله الرحمن الرحيم\n", .{});
    const bismi_allah_str = "in the name of Allah";
    const bismi_allah =  task_tree_lib.Task{.id = 0, .name=bismi_allah_str.* ++ [_]u8{0} ** (34 - bismi_allah_str.len), .progress=12};
    try stdout.print("alhamdo li Allah task name: '{s}'\n", .{bismi_allah.name});

    try bw.flush(); // don't forget to flush!
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
