//! This module implements the minimal subset of libc required by
//! BearSSL. Credits to [ziglibc], these implementations will be
//! inspired by it where possible.
//!
//! [ziglibc]: https://github.com/marler8997/ziglibc

const std = @import("std");

// memcpy, memmove, and memcmp are provided by zig std lib since llvm
// output uses them

export fn strlen(s: [*:0]const u8) callconv(.C) usize {
    return std.mem.len(s);
}

export fn time(
    mT: ?*isize,
) callconv(.C) isize {
    const now = @intCast(isize, std.time.timestamp());
    if (mT) |t| {
        t.* = now;
    }
    return now;
}
