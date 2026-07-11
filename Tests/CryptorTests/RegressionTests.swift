import Foundation
import XCTest
@testable import Cryptor

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
}
