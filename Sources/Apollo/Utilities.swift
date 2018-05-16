import Foundation

extension HTTPURLResponse {
  public var isSuccessful: Bool {
    return (200..<300).contains(statusCode)
  }

  public var statusCodeDescription: String {
    return HTTPURLResponse.localizedString(forStatusCode: statusCode)
  }

  public var textEncoding: String.Encoding? {
    guard let encodingName = textEncodingName else { return nil }

    return String.Encoding(rawValue: CFStringConvertEncodingToNSStringEncoding(CFStringConvertIANACharSetNameToEncoding(encodingName as CFString)))
  }
}

public protocol Matchable {
  associatedtype Base
  static func ~=(pattern: Self, value: Base) -> Bool
}

