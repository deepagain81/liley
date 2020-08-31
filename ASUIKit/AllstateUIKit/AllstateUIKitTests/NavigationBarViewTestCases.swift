//
//  NavigationBarViewTestCase.swift
//  AllstateUIKitTests

import XCTest
@testable import AllstateUIKit

class NavigationBarViewTestCase: XCTestCase {
    var title: String = ""
    var tile1: TileData!
    var tile2: TileData!
    var tile3: TileData!
    var tileImage: UIImage!
    var navSegmentControlData: NavigationBarInfo!
    var navSegmentControlDataStatusRow: NavigationBarInfo!
    var navigationPolicyView: NavigationBarView!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        title = "#098767543121234"
        tileImage = UIImage(named: "FPOCTA")
        tile1 = TileData(image: tileImage, messages: ["ROAD SIDE", "Sample text"])
        tile2 = TileData(image: tileImage, messages: ["ID CARDS", "Sample text"])
        tile3 = TileData(image: tileImage, messages: ["HELP CENTER", "Sample text"])
        createNavBarSegControlData()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        title = ""
        tileImage = nil
        tile1 = nil
        tile2 = nil
        tile3 = nil
        navSegmentControlData = nil
        navSegmentControlDataStatusRow = nil
    }

    /// This function is used to load the data for testing
    func createNavBarSegControlData() {
        let segmentTitles = ["Braking", "High Speeds", "Night Driving"]
        let statusData = StatusHeaderData(with: .header,
                                          statusMessageText: "This vehicle is suspended",
                                          statusHeaderType: .informational)
        navSegmentControlData = NavigationBarInfo(segmentTitles: segmentTitles,
                                                  featureSummary: "#098767543121234")
        navSegmentControlDataStatusRow = NavigationBarInfo(segmentTitles: segmentTitles, statusHeaderData: statusData)
    }

    /// Test if the feature summary label component is created successfully
    func testFeatureSummary_WithPolicyNumber_ShouldFillPolicyNumber() {
        //Arrange
        let navigationData = NavigationBarInfo(featureSummary: title)
        //Act
        navigationPolicyView = navigationBuilder.create(with: navigationData,
                                                        type: .featureSummaryDefault) as? NavigationBarView
        //Assert
        XCTAssertEqual(navigationData.featureSummary, navigationPolicyView?.getFeatureSummarylbl.text)
        XCTAssertNotNil(navigationPolicyView)
    }

    /// Test if the  segment control label component is created successfully
    func testFeatureSummarySegmentControl_WithSegmentTitles_ShouldFillSegmentControlTitles() {
        //Act
        navigationPolicyView = navigationBuilder.create(with: navSegmentControlData!,
                                                        type: .featureSummarySegmentedControl) as? NavigationBarView
        //Assert
        XCTAssertEqual(navSegmentControlData!.segmentTitles?[0],
                       navigationPolicyView?.getSegmentControl.titleForSegment(at: 0))
    }

    /// Test if the segment control with custom row component is created successfully
    func testFeatureSummarySegmentControl_ShouldLoadSegmentControlNavBarWithCustomRow() {
        //Act
        navigationPolicyView = navigationBuilder.create(with: navSegmentControlDataStatusRow!,
                                                        type: .featureSummarySegmentedControlStatusRow)
            as? NavigationBarView
        //Assert
        XCTAssertNotNil(navigationPolicyView)
    }

    /// Test if the feature summary label component hides while scrolling up
    func testFeatureSummary_ScrollUpwards_ShouldChangeFeatureSummarylblAlphaToZero() {
        //Act
        navigationPolicyView = navigationBuilder.create(with: navSegmentControlData!,
                                                        type: .featureSummarySegmentedControl) as? NavigationBarView
        navigationPolicyView?.scrollViewWillBeginDragging(upwards: true)
        XCTAssertEqual(navigationPolicyView.getFeatureSummarylbl.alpha, 0.0)
    }

    /// Test if the custom row component hides while scrolling up
    func testFeatureSummarySegmentControl_CustomRowScrollUpwards_ShouldHideCustomRow() {
        //Act
        navigationPolicyView = navigationBuilder.create(with: navSegmentControlDataStatusRow!,
                                                        type: .featureSummarySegmentedControlStatusRow)
            as? NavigationBarView
        navigationPolicyView?.scrollViewWillBeginDragging(upwards: true)
        XCTAssertTrue(navigationPolicyView?.getStatusHeaderiew?.isHidden ?? false, "View is visible")
    }

    /// Test if the custom row component is shown while scrolling down
    func testFeatureSummarySegmentControl_CustomRowScrollDownwards_ShouldShowCustomRow() {
        //Act
        navigationPolicyView = navigationBuilder.create(with: navSegmentControlDataStatusRow!,
                                                        type: .featureSummarySegmentedControlStatusRow)
            as? NavigationBarView
        navigationPolicyView.scrollViewWillBeginDragging(upwards: false)
        XCTAssertFalse(navigationPolicyView?.getStatusHeaderiew?.isHidden ?? true, "View is hidden")
    }

    /// Test if the segment control selected index changes while setting an index value
    func testFeatureSummarySegmentControl_SetSelectedSegmentIndex_ShouldChangeSelectedSegmentIndex() {
        //Act
        navigationPolicyView = navigationBuilder.create(with: navSegmentControlDataStatusRow!,
                                                        type: .featureSummarySegmentedControlStatusRow)
            as? NavigationBarView
        let selectedSegmentIndex = 1
        navigationPolicyView.setSelectedSegmentIndex(selectedSegmentIndex)
        XCTAssertEqual(navigationPolicyView.getSegmentControl.selectedSegmentIndex, selectedSegmentIndex)
    }

    ///Test for overview header navigation bar component
    func testOverviewHeader_WithQuickAcessTiles_ShouldCreateTiles() {
        //Overview header tiles can be have minimum of 1 and maximum of 3 tiles at a time
        //Arrange - 1 tile
        var navigationData = NavigationBarInfo(leftTile: tile1, userName: "John")
        //Act
        var overviewTiles = navigationBuilder.create(with: navigationData, type: .overviewHeader)
        //Assert
        XCTAssertNotNil(overviewTiles)
        //Arrange - 2 tiles
        navigationData = NavigationBarInfo(leftTile: tile1, middleTile: tile2, userName: "John")
        //Act
        overviewTiles = navigationBuilder.create(with: navigationData, type: .overviewHeader)
        //Assert
        XCTAssertNotNil(overviewTiles)
        //Arrange - 3 tiles
        navigationData = NavigationBarInfo(leftTile: tile1,
                                           middleTile: tile2,
                                           rightTile: tile3,
                                           userName: "John")
        //Act
        overviewTiles = navigationBuilder.create(with: navigationData, type: .overviewHeader)
        //Assert
        XCTAssertNotNil(overviewTiles)
    }

    ///Test for quick access navigation bar component
    func testQuickAccessHeader_WithQuickAcessTiles_ShouldCreateTiles() {
        //Quick Access tiles can be have minimum of 1 and maximum of 3 tiles at a time
        //Arrange - 1 tile
        var navigationData = NavigationBarInfo(leftTile: tile1, userName: "John")
        //Act
        var quickAccessTiles = navigationBuilder.create(with: navigationData, type: .quickAccess)
        //Assert
        XCTAssertNotNil(quickAccessTiles)
        //Arrange - 2 tiles
        navigationData = NavigationBarInfo(leftTile: tile1, middleTile: tile2, userName: "John")
        //Act
        quickAccessTiles = navigationBuilder.create(with: navigationData, type: .quickAccess)
        //Assert
        XCTAssertNotNil(quickAccessTiles)
        //Arrange - 3 tiles
        navigationData = NavigationBarInfo(leftTile: tile1,
                                           middleTile: tile2,
                                           rightTile: tile3,
                                           userName: "John")
        //Act
        quickAccessTiles = navigationBuilder.create(with: navigationData, type: .quickAccess)
        //Assert
        XCTAssertNotNil(quickAccessTiles)
    }
}
