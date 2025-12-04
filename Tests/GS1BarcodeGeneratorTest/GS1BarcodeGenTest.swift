//
//  Test.swift
//  GS1BarcodeGenerator
//
//  Created by Kevin Varga on 30/11/2025.
//

@testable import GS1BarcodeGenerator
import Testing

struct GS1BarcodeGenTest {

    @Test func testGenerateOnlyNumbersGS1BarcodeAsPNGBase64EncodedString() async throws {
        #expect(
            try generateGS1BarcodeAsPNGBase64EncodedString(from: "123456789")
            ==
            "iVBORw0KGgoAAAANSUhEUgAAAHAAAAABEAAAAABzZamwAAAAPElEQVR4nGSOUQoAIAxCpfvf2RhDFPdRms/YHgCQc+bel5xI++6SUmXJkzhTmtyd1J7r/5feXX8AAAD//zzTZ5vYDe9yAAAAAElFTkSuQmCC"
        )
    }
    
    @Test func testGenerateOnlyLettersGS1BarcodeAsPNGBase64EncodedString() async throws {
        #expect(
            try generateGS1BarcodeAsPNGBase64EncodedString(from: "abcDFG")
            ==
            "iVBORw0KGgoAAAANSUhEUgAAAHAAAAABEAAAAABzZamwAAAAQ0lEQVR4nGyOSwoAMQxCFeb+V3YIIkn6WVRan+IHABIpAb7rkFY7fk2qfpq9s2Hjh9/ZMK3T2T1v5uzP8t79BwAA//+66zwFHd09cwAAAABJRU5ErkJggg=="
        )
    }
    
    @Test func testGenerateLettersAndNumbersGS1BarcodeAsPNGBase64EncodedString() async throws {
        #expect(
            try generateGS1BarcodeAsPNGBase64EncodedString(from: "123abc789DFG")
            ==
            "iVBORw0KGgoAAAANSUhEUgAAALIAAAABEAAAAAAPL3csAAAASUlEQVR4nIRQUQpAMQiSd/879xgSag02mJl+KH0AUHV+IxkfNefayBpTd3U66aeq9Nx3ivDe8N3Is326kk3m3M38enL/AAAA//9flLdLv+tHYAAAAABJRU5ErkJggg=="
        )
    }

}
