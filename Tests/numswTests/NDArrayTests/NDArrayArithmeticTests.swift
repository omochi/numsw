
import XCTest
@testable import numsw

class NDArrayArithmeticTests: XCTestCase {
    
    
    func testUnaryPlus() {
        do {
            let a = NDArray<Int>(shape: [2, 2], elements: [1, 2, 3, 4])
            XCTAssertEqual(unary_plus(a), a)
        }
        do {
            let a = NDArray<Double>(shape: [2, 2], elements: [1, 2, 3, 4])
            XCTAssertEqual(unary_plus(a), a)
        }
    }
    
    func testUnaryMinus() {
        do {
            let a = NDArray<Int>(shape: [2, 2], elements: [1, 2, 3, 4])
            XCTAssertEqual(unary_minus(a), NDArray(shape: [2, 2], elements: [-1, -2, -3, -4]))
        }
        do {
            let a = NDArray<Double>(shape: [2, 2], elements: [1, 2, 3, 4])
            XCTAssertEqual(unary_minus(a), NDArray(shape: [2, 2], elements: [-1, -2, -3, -4]))
        }
    }
    
    func testPlus() {
        // NDArray and scalar
        do {
            let a = NDArray<Int>(shape: [2, 2], elements: [1, 2, 3, 4])
            XCTAssertEqual(add(a, 1), NDArray(shape: [2, 2], elements: [2, 3, 4, 5]))
            XCTAssertEqual(add(1, a), NDArray(shape: [2, 2], elements: [2, 3, 4, 5]))
        }
        do {
            let a = NDArray<Double>(shape: [2, 2], elements: [1, 2, 3, 4])
            XCTAssertEqual(add(a, 1), NDArray(shape: [2, 2], elements: [2, 3, 4, 5]))
            XCTAssertEqual(add(1, a), NDArray(shape: [2, 2], elements: [2, 3, 4, 5]))
        }
        
        // NDArray and NDArray
        do {
            let a = NDArray<Int>(shape: [2, 2], elements: [1, 2, 3, 4])
            let b = NDArray<Int>(shape: [2, 2], elements: [-1, 0, 1, 0])
            XCTAssertEqual(add(a, b), NDArray(shape: [2, 2], elements: [0, 2, 4, 4]))
        }
        do {
            let a = NDArray<Double>(shape: [2, 2], elements: [1, 2, 3, 4])
            let b = NDArray<Double>(shape: [2, 2], elements: [-1, 0, 1, 0])
            XCTAssertEqual(add(a, b), NDArray(shape: [2, 2], elements: [0, 2, 4, 4]))
        }
    }
    
    func testMinus() {
        // NDArray and scalar
        do {
            let a = NDArray<Int>(shape: [2, 2], elements: [1, 2, 3, 4])
            XCTAssertEqual(subtract(a, 1), NDArray(shape: [2, 2], elements: [0, 1, 2, 3]))
            XCTAssertEqual(subtract(1, a), NDArray(shape: [2, 2], elements: [0, -1, -2, -3]))
        }
        do {
            let a = NDArray<Double>(shape: [2, 2], elements: [1, 2, 3, 4])
            XCTAssertEqual(subtract(a, 1), NDArray(shape: [2, 2], elements: [0, 1, 2, 3]))
            XCTAssertEqual(subtract(1, a), NDArray(shape: [2, 2], elements: [0, -1, -2, -3]))
        }
        
        // NDArray and NDArray
        do {
            let a = NDArray<Int>(shape: [2, 2], elements: [1, 2, 3, 4])
            let b = NDArray<Int>(shape: [2, 2], elements: [-1, 0, 1, 0])
            XCTAssertEqual(subtract(a, b), NDArray(shape: [2, 2], elements: [2, 2, 2, 4]))
        }
        do {
            let a = NDArray<Double>(shape: [2, 2], elements: [1, 2, 3, 4])
            let b = NDArray<Double>(shape: [2, 2], elements: [-1, 0, 1, 0])
            XCTAssertEqual(subtract(a, b), NDArray(shape: [2, 2], elements: [2, 2, 2, 4]))
        }
    }
    
    func testMultiply() {
        // NDArray and scalar
        do {
            let a = NDArray<Int>(shape: [2, 2], elements: [1, 2, 3, 4])
            XCTAssertEqual(multiply(a, 2), NDArray(shape: [2, 2], elements: [2, 4, 6, 8]))
            XCTAssertEqual(multiply(2, a), NDArray(shape: [2, 2], elements: [2, 4, 6, 8]))
        }
        do {
            let a = NDArray<Double>(shape: [2, 2], elements: [1, 2, 3, 4])
            XCTAssertEqual(multiply(a, 2), NDArray(shape: [2, 2], elements: [2, 4, 6, 8]))
            XCTAssertEqual(multiply(2, a), NDArray(shape: [2, 2], elements: [2, 4, 6, 8]))
        }
        
        // NDArray and NDArray
        do {
            let a = NDArray<Int>(shape: [2, 2], elements: [1, 2, 3, 4])
            let b = NDArray<Int>(shape: [2, 2], elements: [-1, 0, 2, 1])
            XCTAssertEqual(multiply(a, b), NDArray(shape: [2, 2], elements: [-1, 0, 6, 4]))
        }
        do {
            let a = NDArray<Double>(shape: [2, 2], elements: [1, 2, 3, 4])
            let b = NDArray<Double>(shape: [2, 2], elements: [-1, 0, 2, 1])
            XCTAssertEqual(multiply(a, b), NDArray(shape: [2, 2], elements: [-1, 0, 6, 4]))
        }
    }
    
    func testDivide() {
        // NDArray and scalar
        do {
            let a = NDArray<Int>(shape: [2, 2], elements: [1, 2, 3, 4])
            XCTAssertEqual(divide(a, 2), NDArray(shape: [2, 2], elements: [0, 1, 1, 2]))
            XCTAssertEqual(divide(2, a), NDArray(shape: [2, 2], elements: [2, 1, 0, 0]))
        }
        do {
            let a = NDArray<Double>(shape: [2, 2], elements: [1, 2, 3, 4])
            XCTAssertEqual(divide(a, 2), NDArray(shape: [2, 2], elements: [0.5, 1.0, 1.5, 2.0]))
            XCTAssertEqualWithAccuracy(divide(2, a), NDArray(shape: [2, 2], elements: [2.0, 1.0, 2.0/3.0, 0.5]),
                                       accuracy: 1e-10)
        }
        
        // NDArray and NDArray
        do {
            let a = NDArray<Int>(shape: [2, 2], elements: [1, 2, 3, 4])
            let b = NDArray<Int>(shape: [2, 2], elements: [-1, 2, 6, 1])
            XCTAssertEqual(divide(a, b), NDArray(shape: [2, 2], elements: [-1, 1, 0, 4]))
        }
        do {
            let a = NDArray<Double>(shape: [2, 2], elements: [1, 2, 3, 4])
            let b = NDArray<Double>(shape: [2, 2], elements: [-1, 2, 6, 1])
            XCTAssertEqual(divide(a, b), NDArray(shape: [2, 2], elements: [-1, 1, 0.5, 4]))
        }
    }
    
    func testModulo() {
        // NDArray and scalar
        do {
            let a = NDArray<Int>(shape: [2, 2], elements: [1, 2, 3, 4])
            XCTAssertEqual(modulo(a, 2), NDArray(shape: [2, 2], elements: [1, 0, 1, 0]))
            XCTAssertEqual(modulo(2, a), NDArray(shape: [2, 2], elements: [0, 0, 2, 2]))
        }
        
        // NDArray and NDArray
        do {
            let a = NDArray<Int>(shape: [2, 2], elements: [1, 2, 3, 4])
            let b = NDArray<Int>(shape: [2, 2], elements: [3, 2, 2, 3])
            XCTAssertEqual(modulo(a, b), NDArray(shape: [2, 2], elements: [1, 0, 1, 1]))
        }
    }
    
}
