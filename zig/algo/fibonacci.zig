// بسم الله الرحمن الرحيم
// la ilaha illa Allah Mohammed rassoul Allah

const std = @import("std");

var memoized_fib_results: [101]usize = [2]usize{ 1, 1 } ++ ([1]usize{0} ** 99);

fn U(n: usize) usize {
    if (n < 2) return n;
    if (memoized_fib_results[n] != 0) return memoized_fib_results[n];
    memoized_fib_results[n] = U(n - 1) + U(n - 2);
    return memoized_fib_results[n];
}

pub fn main() !void {
    std.debug.print("بسم الله الرحمن الرحيم\n", .{});
    // std.debug.print("alhamdo li Allah U({d}) == {d}\n", .{ 6, U(6) });
    // var i: usize = 0;
    // while (i <= 91) : (i += 10) {
    //     std.debug.print("alhamdo li Allah U({d}) == {d}\n", .{ i, U(i) });
    // }

    var buffer: [3]u8 = .{ 0, 0, 0 };
    const input_n = try std.fmt.parseInt(usize, buffer[0..try std.io.getStdIn().read(&buffer)], 10);

    std.debug.print("\nalhamdo li Allah U({d}) == {d}\n", .{ input_n, U(input_n) });
}
