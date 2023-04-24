public let kDefaultAssertionFailure = Swift.assertionFailure
public var evaluateAssertionFailure: (@autoclosure () -> String, StaticString, UInt) -> Void
    = kDefaultAssertionFailure

public func assertionFailure(_ message: @autoclosure () -> String = "assertion failure",
                             file: StaticString = #file,
                             line: UInt = #line) {
    evaluateAssertionFailure(message(), file, line)
}
