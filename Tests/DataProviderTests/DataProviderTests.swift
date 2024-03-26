import XCTest
import SwiftData
@testable import DataProvider

final class DataProviderTests: XCTestCase {
    /**
     初始化一个新的、干净的数据库实例。
     利用 DataHandler 添加新的数据项。
     通过容器的 mainContext 从数据库中检索 Item 数据。
     断言检索到的数据是否符合预期。
     */
    @MainActor
    func testNewItem() async throws {
        
        // Arrange
        let container = try ContainerForTest.temp(#function)
        let hander = DataHandler(modelContainer: container)
        
        // ACT
        let date = Date(timeIntervalSince1970: 0)
        try await hander.newItem(date: date)
        
        // Assert
        let fetchDescriptor = FetchDescriptor<Item>()
        let items = try container.mainContext.fetch(fetchDescriptor)
        
        XCTAssertNotNil(items.first, "The item should be created and fetched successfully.")
        XCTAssertEqual(items.count, 1, "There should be exactly one item in the store")
        
        if let firstItem = items.first {
            XCTAssertEqual(firstItem.timestamp, date, "The item's timestamp should match the initially provided date.")
        } else {
            XCTFail("Excepted to find an item but none was found")
        }
    }
}
