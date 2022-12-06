const std = @import("std");

const Error = error{
    NotFoundError
};

const unique_size = 4;

pub fn main() !void {
    std.debug.print("{d}", .{try impl()});
}

pub fn impl() !u64 {
    const file = try std.fs.cwd().openFile(
        "input.txt",
        .{},
    );

    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();
    var buf: [8096]u8 = undefined;

    while (try in_stream.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        for (line) | _, index | {
            var checking_array = line[index .. index + unique_size];
            var count: u8 = 0;
            for (checking_array) |ch| {
                for (checking_array) |c| {
                    if (ch == c) count += 1;
                }
                
            }
        
            if (count == unique_size) 
                return @as(u64, index + unique_size);
        }
    }

    file.close();
    return Error.NotFoundError;
}