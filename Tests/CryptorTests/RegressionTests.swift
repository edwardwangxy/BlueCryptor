import Foundation
import XCTest
@testable import Cryptor

@MainActor
final class CryptorRegressionTests: XCTestCase {
    func testKnownDigestVectorsIncludingEmptyInput() {
        XCTAssertEqual("".sha256, "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
        XCTAssertEqual("abc".sha256, "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad")
        XCTAssertEqual(Data("abc".utf8).sha256.count, 32)
    }

    func testHexDecoderRejectsOddLengthAndInvalidCharacters() {
        XCTAssertEqual(CryptoUtils.byteArray(fromHex: "abc"), [])
        XCTAssertEqual(CryptoUtils.byteArray(fromHex: "gg"), [])
        XCTAssertEqual(CryptoUtils.byteArray(fromHex: ""), [])
    }

    func testSupportedSHAAndHMACAlgorithmsRemainAvailable() {
        XCTAssertEqual(Digest.Algorithm.sha256, .sha256)
        XCTAssertEqual(HMAC.Algorithm.sha512.digestLength(), 64)
        let hmac = HMAC(using: .sha256, key: "key").update(string: "message")?.final()
        XCTAssertEqual(hmac?.count, 32)
    }
}
