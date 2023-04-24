public typealias ActionCompletion = () -> Void

public func shouldNotBeCalled() {
    assertionFailure("should not be called")
}

public func shouldNotBeCalled<T>(_ value: T) {
    assertionFailure("should not be called, but got called with \(value)")
}
