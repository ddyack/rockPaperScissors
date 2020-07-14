//
//  RPSTests.swift
//  RPSTests
//
//  Created by ddyack on 13.07.2020.
//  Copyright © 2020 ddyack. All rights reserved.
//

import XCTest
@testable import RPS

class RPSTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRockResult() throws {
        let sign = Sign.rock
        XCTAssert(sign.getResult(for: .rock) == .draw)
        XCTAssert(sign.getResult(for: .paper) == .lose)
        XCTAssert(sign.getResult(for: .scissors) == .win)
    }
    
    func testPaperResult() throws {
        let sign = Sign.paper
        XCTAssert(sign.getResult(for: .rock) == .win)
        XCTAssert(sign.getResult(for: .paper) == .draw)
        XCTAssert(sign.getResult(for: .scissors) == .lose)
    }
    
    func testScissorsResult() throws {
        let sign = Sign.scissors
        XCTAssert(sign.getResult(for: .rock) == .lose)
        XCTAssert(sign.getResult(for: .paper) == .win)
        XCTAssert(sign.getResult(for: .scissors) == .draw)
    }
}
