const std = @import("std");

// pub const hash = @import("hash.zig");
// pub const hmac = @import("hmac.zig");
// pub const kdf = @import("kdf.zig");
// pub const rand = @import("rand.zig");
// pub const prf = @import("prf.zig");
// pub const block = @import("block.zig");
// pub const aead = @import("aead.zig");
// pub const rsa = @import("rsa.zig");
// pub const ec = @import("ec.zig");
// pub const ssl = @import("ssl.zig");
// pub const x509 = @import("x509.zig");
// pub const pem = @import("pem.zig");

pub const ConfigOption = extern struct {
    name: [*:0]const u8,
    value: c_long,
};

// Since null name indicates the end of the list, we need a separate
// anonymous struct from ConfigOption that allows that nullability
extern fn br_get_config() [*c]const extern struct {
    name: ?[*:0]const u8,
    value: c_long,
};
pub fn getConfig() []const ConfigOption {
    const raw_config = br_get_config();

    var len: usize = 0;
    while (raw_config[len].name) |_| {
        len += 1;
    }

    return @ptrCast([*]const ConfigOption, raw_config)[0..len];
}
