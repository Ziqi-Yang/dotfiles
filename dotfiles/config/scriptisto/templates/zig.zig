//usr/bin/env scriptisto $0; exit
// scriptisto-begin
// script_src: script.zig
// build_cmd: zig build-exe script.zig
// scriptisto-end

const std = @import("std");

pub fn main() anyerror!void {
    std.log.info("Hello, World!", .{});
}
