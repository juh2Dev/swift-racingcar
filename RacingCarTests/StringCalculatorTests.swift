//
//  StringCalculator.swift
//  RacingCarTests
//
//  Created by swave on 2022/04/30.
//

import XCTest
//@testable import RacingCar

//MARK: 2단계 문자열 계산기

class StringCalculatorTests: XCTestCase {

    
    let stringCalculator: StringCalculator = StringCalculator()
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK: - 실패케이스를 먼저 만들자.
    // 잘못된 값이 들어오는 부분
    // 나눗셈의 경우 결과 값을 정수로 떨어지지 않는 경우
    func test_dividedValueIsNotInteger() throws {
        let request: String = "3 * 5 / 2"
        XCTAssertThrowsError(try stringCalculator.calculate(string: request))
    }
    
    //입력값이 nil이거나 빈 공백 문자일 경우 throws
    func test_inputValueISBlank(){
        let request: String = ""
        
        do {
            _ = try stringCalculator.calculate(string: request)
        } catch {
            XCTAssertEqual(error as! StringCalculatorError,
                           StringCalculatorError.invalidInputString)
        }
    }
    
    //사칙연산 기호가 아닌 경우 throws
    func test_invalidOperatorInInputValue(){
        let request: String = "2 @ 3 * 4 / 2"
        
        do {
            _ = try stringCalculator.calculate(string: request)
        } catch {
            XCTAssertEqual(error as! StringCalculatorError,
                           StringCalculatorError.invalidOperator)
        }
    }
    

    
    //MARK: -
    func test_calculateString_2더하기3곱하기4나누기2는10() throws {
        let request: String = "2 + 3 * 4 / 2"
        
        let result: Int = try stringCalculator.calculate(string: request)
        print("result \(result)")
        XCTAssertEqual(result, 10)
    }
    
    func test_calculateString_2더하기3은5() throws {
        let request: String = "2 + 3"
        
        let result: Int = try stringCalculator.calculate(string: request)
        print("result \(result)")
        XCTAssertEqual(result, 5)
    }
    
    func test_calculateString_1부터10까지더하면55() throws {
        
        let request: String = "1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10"
        
        let result: Int = try stringCalculator.calculate(string: request)
        print("result \(result)")
        XCTAssertEqual(result, 55)
    }
}
