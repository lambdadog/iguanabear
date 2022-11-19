const std = @import("std");

test "IguanaBear.Hash" {
    _ = MD5Context;
    _ = SHA1Context;
    _ = SHA224Context;
    _ = SHA256Context;
    _ = SHA384Context;
    _ = SHA512Context;
}

pub const MD5Context = extern struct {
    pub const id = 1;
    pub const size = 16;

    vtable: *const anyopaque,
    buffer: [64]u8,
    count: u64,
    value: [4]u32,

    extern fn br_md5_init(*@This()) void;
    pub fn init(self: *@This()) void {
        br_md5_init(self);
    }

    extern fn br_md5_update(*@This(), *const anyopaque, usize) void;
    pub fn update(self: *@This(), data: []const u8) void {
        br_md5_update(self, @ptrCast(*const anyopaque, data.ptr), data.len);
    }

    extern fn br_md5_out(*const @This(), *anyopaque) void;
    pub fn out(self: *const @This(), buf: *[size]u8) void {
        br_md5_out(self, @ptrCast(*anyopaque, buf));
    }

    extern fn br_md5_state(*const @This(), *anyopaque) u64;
    pub fn state(self: *const @This(), buf: *[4]u32) u64 {
        return br_md5_state(self, @ptrCast(*anyopaque, buf));
    }

    extern fn br_md5_set_state(*@This(), *const anyopaque, u64) void;
    pub fn setState(self: *@This(), in: *const [4]u32, len: u64) void {
        br_md5_set_state(self, @ptrCast(*const anyopaque, in), len);
    }

    test "IguanaBear.Hash.MD5Context" {
        const input_bytes = "abcdefghijklmnopqrstuvwxyz";
        const expected_hex = "c3fcd3d76192e4007dfb496cca67e13b";

        var ctx: MD5Context = undefined;
        var res: [MD5Context.size]u8 = undefined;

        ctx.init();
        ctx.update(input_bytes);
        ctx.out(&res);

        var expected_bytes: [MD5Context.size]u8 = undefined;
        for (expected_bytes) |*r, i| {
            r.* = std.fmt.parseInt(u8, expected_hex[2 * i .. 2 * i + 2], 16) catch unreachable;
        }

        try std.testing.expectEqualSlices(u8, res[0..res.len], expected_bytes[0..expected_bytes.len]);
    }
};

pub const SHA1Context = extern struct {
    pub const id = 2;
    pub const size = 20;

    vtable: *const anyopaque,
    buffer: [64]u8,
    count: u64,
    value: [5]u32,

    extern fn br_sha1_init(*@This()) void;
    pub fn init(self: *@This()) void {
        br_sha1_init(self);
    }

    extern fn br_sha1_update(*@This(), *const anyopaque, usize) void;
    pub fn update(self: *@This(), data: []const u8) void {
        br_sha1_update(self, @ptrCast(*const anyopaque, data.ptr), data.len);
    }

    extern fn br_sha1_out(*const @This(), *anyopaque) void;
    pub fn out(self: *const @This(), buf: *[size]u8) void {
        br_sha1_out(self, @ptrCast(*anyopaque, buf));
    }

    extern fn br_sha1_state(*const @This(), *anyopaque) u64;
    pub fn state(self: *const @This(), buf: *[5]u32) u64 {
        return br_sha1_state(self, @ptrCast(*anyopaque, buf));
    }

    extern fn br_sha1_set_state(*@This(), *const anyopaque, u64) void;
    pub fn setState(self: *@This(), in: *const [5]u32, len: u64) void {
        br_sha1_set_state(self, @ptrCast(*const anyopaque, in), len);
    }

    test "IguanaBear.Hash.SHA1Context" {
        const input_bytes = "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq";
        const expected_hex = "84983e441c3bd26ebaae4aa1f95129e5e54670f1";

        var ctx: SHA1Context = undefined;
        var res: [SHA1Context.size]u8 = undefined;

        ctx.init();
        ctx.update(input_bytes);
        ctx.out(&res);

        var expected_bytes: [SHA1Context.size]u8 = undefined;
        for (expected_bytes) |*r, i| {
            r.* = std.fmt.parseInt(u8, expected_hex[2 * i .. 2 * i + 2], 16) catch unreachable;
        }

        try std.testing.expectEqualSlices(u8, res[0..res.len], expected_bytes[0..expected_bytes.len]);
    }
};

pub const SHA224Context = extern struct {
    pub const id = 3;
    pub const size = 28;

    vtable: *const anyopaque,
    buffer: [64]u8,
    count: u64,
    value: [8]u32,

    extern fn br_sha224_init(*@This()) void;
    pub fn init(self: *@This()) void {
        br_sha224_init(self);
    }

    extern fn br_sha224_update(*@This(), *const anyopaque, usize) void;
    pub fn update(self: *@This(), data: []const u8) void {
        br_sha224_update(self, @ptrCast(*const anyopaque, data.ptr), data.len);
    }

    extern fn br_sha224_out(*const @This(), *anyopaque) void;
    pub fn out(self: *const @This(), buf: *[size]u8) void {
        br_sha224_out(self, @ptrCast(*anyopaque, buf));
    }

    extern fn br_sha224_state(*const @This(), *anyopaque) u64;
    pub fn state(self: *const @This(), buf: *[8]u32) u64 {
        return br_sha224_state(self, @ptrCast(*anyopaque, buf));
    }

    extern fn br_sha224_set_state(*@This(), *const anyopaque, u64) void;
    pub fn setState(self: *@This(), in: *const [8]u32, len: u64) void {
        br_sha224_set_state(self, @ptrCast(*const anyopaque, in), len);
    }

    test "IguanaBear.Hash.SHA224Context" {
        const input_bytes = "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq";
        const expected_hex = "75388b16512776cc5dba5da1fd890150b0c6455cb4f58b1952522525";

        var ctx: SHA224Context = undefined;
        var res: [SHA224Context.size]u8 = undefined;

        ctx.init();
        ctx.update(input_bytes);
        ctx.out(&res);

        var expected_bytes: [SHA224Context.size]u8 = undefined;
        for (expected_bytes) |*r, i| {
            r.* = std.fmt.parseInt(u8, expected_hex[2 * i .. 2 * i + 2], 16) catch unreachable;
        }

        try std.testing.expectEqualSlices(u8, res[0..res.len], expected_bytes[0..expected_bytes.len]);
    }
};

// NOTE: the br_sha224_xxx usage in this is intentional, several of
// the br_sha256_xxx calls are simply preprocessor #defines
pub const SHA256Context = extern struct {
    pub const id = 4;
    pub const size = 32;

    vtable: *const anyopaque,
    buffer: [64]u8,
    count: u64,
    value: [8]u32,

    extern fn br_sha256_init(*@This()) void;
    pub fn init(self: *@This()) void {
        br_sha256_init(self);
    }

    extern fn br_sha224_update(*@This(), *const anyopaque, usize) void;
    pub fn update(self: *@This(), data: []const u8) void {
        br_sha224_update(self, @ptrCast(*const anyopaque, data.ptr), data.len);
    }

    extern fn br_sha256_out(*const @This(), *anyopaque) void;
    pub fn out(self: *const @This(), buf: *[size]u8) void {
        br_sha256_out(self, @ptrCast(*anyopaque, buf));
    }

    extern fn br_sha224_state(*const @This(), *anyopaque) u64;
    pub fn state(self: *const @This(), buf: *[8]u32) u64 {
        return br_sha224_state(self, @ptrCast(*anyopaque, buf));
    }

    extern fn br_sha224_set_state(*@This(), *const anyopaque, u64) void;
    pub fn setState(self: *@This(), in: *const [8]u32, len: u64) void {
        br_sha224_set_state(self, @ptrCast(*const anyopaque, in), len);
    }

    test "IguanaBear.Hash.SHA256Context" {
        const input_bytes = "abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq";
        const expected_hex = "248d6a61d20638b8e5c026930c3e6039a33ce45964ff2167f6ecedd419db06c1";

        var ctx: SHA256Context = undefined;
        var res: [SHA256Context.size]u8 = undefined;

        ctx.init();
        ctx.update(input_bytes);
        ctx.out(&res);

        var expected_bytes: [SHA256Context.size]u8 = undefined;
        for (expected_bytes) |*r, i| {
            r.* = std.fmt.parseInt(u8, expected_hex[2 * i .. 2 * i + 2], 16) catch unreachable;
        }

        try std.testing.expectEqualSlices(u8, res[0..res.len], expected_bytes[0..expected_bytes.len]);
    }
};

pub const SHA384Context = extern struct {
    pub const id = 5;
    pub const size = 48;

    vtable: *const anyopaque,
    buffer: [128]u8,
    count: u64,
    value: [8]u64,

    extern fn br_sha384_init(*@This()) void;
    pub fn init(self: *@This()) void {
        br_sha384_init(self);
    }

    extern fn br_sha384_update(*@This(), *const anyopaque, usize) void;
    pub fn update(self: *@This(), data: []const u8) void {
        br_sha384_update(self, @ptrCast(*const anyopaque, data.ptr), data.len);
    }

    extern fn br_sha384_out(*const @This(), *anyopaque) void;
    pub fn out(self: *const @This(), buf: *[size]u8) void {
        br_sha384_out(self, @ptrCast(*anyopaque, buf));
    }

    extern fn br_sha384_state(*const @This(), *anyopaque) u64;
    pub fn state(self: *const @This(), buf: *[8]u64) u64 {
        return br_sha384_state(self, @ptrCast(*anyopaque, buf));
    }

    extern fn br_sha384_set_state(*@This(), *const anyopaque, u64) void;
    pub fn setState(self: *@This(), in: *const [8]u64, len: u64) void {
        br_sha384_set_state(self, @ptrCast(*const anyopaque, in), len);
    }

    test "IguanaBear.Hash.SHA384Context" {
        const input_bytes = "abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmnhijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu";
        const expected_hex = "09330c33f71147e83d192fc782cd1b4753111b173b3b05d22fa08086e3b0f712fcc7c71a557e2db966c3e9fa91746039";

        var ctx: SHA384Context = undefined;
        var res: [SHA384Context.size]u8 = undefined;

        ctx.init();
        ctx.update(input_bytes);
        ctx.out(&res);

        var expected_bytes: [SHA384Context.size]u8 = undefined;
        for (expected_bytes) |*r, i| {
            r.* = std.fmt.parseInt(u8, expected_hex[2 * i .. 2 * i + 2], 16) catch unreachable;
        }

        try std.testing.expectEqualSlices(u8, res[0..res.len], expected_bytes[0..expected_bytes.len]);
    }
};

// sha384 usage is intentional -- like sha256, several of the methods
// are preprocessor defines to it
pub const SHA512Context = extern struct {
    pub const id = 6;
    pub const size = 64;

    vtable: *const anyopaque,
    buffer: [128]u8,
    count: u64,
    value: [8]u64,

    extern fn br_sha512_init(*@This()) void;
    pub fn init(self: *@This()) void {
        br_sha512_init(self);
    }

    extern fn br_sha384_update(*@This(), *const anyopaque, usize) void;
    pub fn update(self: *@This(), data: []const u8) void {
        br_sha384_update(self, @ptrCast(*const anyopaque, data.ptr), data.len);
    }

    extern fn br_sha512_out(*const @This(), *anyopaque) void;
    pub fn out(self: *const @This(), buf: *[size]u8) void {
        br_sha512_out(self, @ptrCast(*anyopaque, buf));
    }

    extern fn br_sha384_state(*const @This(), *anyopaque) u64;
    pub fn state(self: *const @This(), buf: *[8]u64) u64 {
        return br_sha384_state(self, @ptrCast(*anyopaque, buf));
    }

    extern fn br_sha384_set_state(*@This(), *const anyopaque, u64) void;
    pub fn setState(self: *@This(), in: *const [8]u64, len: u64) void {
        br_sha384_set_state(self, @ptrCast(*const anyopaque, in), len);
    }

    test "IguanaBear.Hash.SHA512Context" {
        const input_bytes = "abcdefghbcdefghicdefghijdefghijkefghijklfghijklmghijklmnhijklmnoijklmnopjklmnopqklmnopqrlmnopqrsmnopqrstnopqrstu";
        const expected_hex = "8e959b75dae313da8cf4f72814fc143f8f7779c6eb9f7fa17299aeadb6889018501d289e4900f7e4331b99dec4b5433ac7d329eeb6dd26545e96e55b874be909";

        var ctx: SHA512Context = undefined;
        var res: [SHA512Context.size]u8 = undefined;

        ctx.init();
        ctx.update(input_bytes);
        ctx.out(&res);

        var expected_bytes: [SHA512Context.size]u8 = undefined;
        for (expected_bytes) |*r, i| {
            r.* = std.fmt.parseInt(u8, expected_hex[2 * i .. 2 * i + 2], 16) catch unreachable;
        }

        try std.testing.expectEqualSlices(u8, res[0..res.len], expected_bytes[0..expected_bytes.len]);
    }
};
