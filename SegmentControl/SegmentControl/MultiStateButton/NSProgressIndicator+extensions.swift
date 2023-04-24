#if os(macOS)
import AppKit

//  https://stackoverflow.com/a/32396595/2895314

extension NSProgressIndicator {
    func set(polynomialColor: NSColor) {
        if let adjustedColor = polynomialColor.usingColorSpace(.sRGB) {
            let red = adjustedColor.redComponent
            let green = adjustedColor.greenComponent
            let blue = adjustedColor.blueComponent

            let redVector = CIVector(x: red)
            let greenVector = CIVector(x: green)
            let blueVector = CIVector(x: blue)

            let colorPolynomialFilter = CIFilter(name: "CIColorPolynomial")!
            colorPolynomialFilter.setDefaults()
            colorPolynomialFilter.setValue(redVector, forKey: "inputRedCoefficients")
            colorPolynomialFilter.setValue(greenVector, forKey: "inputGreenCoefficients")
            colorPolynomialFilter.setValue(blueVector, forKey: "inputBlueCoefficients")
            contentFilters = [colorPolynomialFilter]
        }
    }
}
#endif
