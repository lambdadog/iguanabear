const std = @import("std");

test "IguanaBear" {
    _ = Hash;
}

pub const Hash = @import("hash.zig");
// pub const HMAC = @import("hmac.zig");
// pub const KDF = @import("kdf.zig");
// pub const Rand = @import("rand.zig");
// pub const PRF = @import("prf.zig");
// pub const Block = @import("block.zig");
// pub const AEAD = @import("aead.zig");
// pub const RSA = @import("rsa.zig");
// pub const EC = @import("ec.zig");
// pub const SSL = @import("ssl.zig");
// pub const X509 = @import("x509.zig");
// pub const PEM = @import("pem.zig");

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
