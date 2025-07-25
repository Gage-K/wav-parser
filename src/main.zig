const std = @import("std");
const print = std.log.warn;

test "parsing" {
    const filepath = "/Users/joachimpfefferkorn/Downloads/billie_jean.wav";

    //WARNING: will not work with 0.15.0
    const file = try std.fs.cwd().openFile(filepath, .{});
    //first four chars should be RIFF
    defer file.close();
    const reader = file.reader();

    var buf: [4]u8 = undefined;
    _ = try reader.readAll(&buf);
    print("ckID: {s}", .{buf});

    const chunksize = try reader.readInt(u32, .little);
    print("chunksize: {d}", .{chunksize});

    _ = try reader.readAll(&buf);
    print("WAVEID: {s}", .{buf});
}
