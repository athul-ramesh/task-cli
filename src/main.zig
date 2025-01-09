const std = @import("std");

pub fn main() !void {
    var file = try std.fs.cwd().openFile("foo.txt", .{});
    defer file.close();

    var buf = std.io.bufferedReader(file.reader());
    var in_stream = buf.reader();

    var buffer: [1024]u8 = undefined;
    while (try in_stream.readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        std.debug.print("{s}\n", .{line});
    }
}
