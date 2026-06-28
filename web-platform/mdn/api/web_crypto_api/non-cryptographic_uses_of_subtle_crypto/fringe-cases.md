# Fringe Cases

## Warnings & Notes

> [!NOTE]
> This section is talking about password security and the hash functions provided by SubtleCrypto are not suitable for this use case. For these purposes you need expensive slow hash functions like `scrypt` and `bcrypt`. SHA is designed to be pretty fast and efficient, which makes it unsuitable for password hashing. This section is purely for your interest — do not use the Web Crypto API to hash passwords on the client.

