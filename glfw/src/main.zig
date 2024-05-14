//بسم الله الرحمن الرحيم
//la ilaha illa Allah Mohammed Rassoul Allah
const std = @import("std");
const c = @cImport({
    @cInclude("GLFW/glfw3.h");
});

pub fn main() !void {
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();
    try stdout.print("بسم الله الرحمن الرحيم\n", .{});
    _ = c.glfwInit();
}
