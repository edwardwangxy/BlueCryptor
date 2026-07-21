# Swift 6 migration

Release version: 3.0.0.

- The package now requires Swift tools 6 and uses Swift 6 language mode. Its minimum iOS version is 13.
- MD2, MD4, and MD5 digest APIs were removed because their CommonCrypto implementations are unavailable or deprecated on the supported Apple platforms.
- HMAC-MD5 was removed with the other MD5 public API. SHA-1, SHA-224, SHA-256, SHA-384, and SHA-512 digests and HMAC remain available.
- `StreamCryptor.Options` and hash algorithm values are Sendable, and shared option values are immutable.

## Major release checklist

- Version 3.0.0 ships the compiler, deployment, and removed cryptographic API changes above as a major release.
- The CocoaPods specification now advertises Swift 6, iOS 13, and the 3.0.0 source tag.
- Rerun the Xcode 16.4/26.0.1 matrix before publishing any follow-up tag and update downstream version constraints when adopting this release.
