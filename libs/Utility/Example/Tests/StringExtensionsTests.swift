import XCTest

import Utility

import Nimble

class StringExtensionsTests: XCTestCase {

  func test_string_is_nil_or_empty() {
    // given
    let string: String? = "test"
    let emptyString: String? = ""
    let nilString: String? = nil

    // when
    let stringResult: Bool = string.isNilOrEmpty
    let emptyStringResult: Bool = emptyString.isNilOrEmpty
    let nilStringResult: Bool = nilString.isNilOrEmpty

    // then
    expect(stringResult) == false
    expect(emptyStringResult) == true
    expect(nilStringResult) == true
  }
}
