//
//  YourDevicesViewControllerTests.swift
//  BasalMMATests
//
//  Created by Sajal Kaushik on 09/06/20.
//  Copyright © 2020 Eli Lilly and Company. All rights reserved.
//

import Nimble
import Quick
@testable import BasalMMA

/**
 The purpose of the `YourDevicesViewControllerTests` is to unit test `YourDevicesViewController`
 */
class YourDevicesViewControllerTests: QuickSpec {
    var viewController: YourDevicesViewController!
    override func spec() {
        // Initial setup
        viewController = YourDevicesViewController.instantiateFromStoryboard()
        viewController.viewModel = YourDevicesViewModel()
        viewController.loadView()
        viewController.viewDidLoad()
        viewController.viewWillAppear(true)

        describe("YourDevices ViewController") {
            context("when loaded") {
                it("should have all the IBOutlets") {
                    self.testIBOutlets()
                }
            }
            context("TableView") {
                it("datasource and delegate shouldn't be nil") {
                    self.testDataSourceAndDelegate()
                }
            }
            context("TableView") {
                it("should return correct number of rows") {
                    self.testNumberOfRows()
                }
            }
            context("Is loaded") {
                it("accessibility indentifiers should be set") {
                    self.testAccssibilityIdentifiers()
                }
            }
            context("when loaded") {
                it("should have all the cell IBOutlets") {
                    self.testCellIBOutlets()
                }
            }
        }
    }

    /**
     The purpose of this function to check if all the IBOutlets are not nil.
     */
    func testIBOutlets() {
        expect(self.viewController.tableView).toNot(beNil())
        expect(self.viewController.headerView).toNot(beNil())
        expect(self.viewController.headerBody).toNot(beNil())
        expect(self.viewController.headerLabel).toNot(beNil())
        expect(self.viewController.separatorView).toNot(beNil())
    }

    /**
     The purpose of this function to check if tableview datasource and delegate are not nil.
     */
    func testDataSourceAndDelegate() {
        expect(self.viewController.tableView.dataSource).toNot(beNil())
        expect(self.viewController.tableView.delegate).toNot(beNil())
    }

    /**
     The purpose of this function to check number of rows in tableview.
     */
    func testNumberOfRows() {
        expect(self.viewController.tableView.numberOfRows(inSection: 0)).to(equal(viewController.viewModel.dataSource[0].count))
        expect(self.viewController.tableView.numberOfRows(inSection: 1)).to(equal(viewController.viewModel.dataSource[1].count))
    }

    /**
     The purpose of this function to check all the IBOutlets have accessibility identifiers.
     */
    func testAccssibilityIdentifiers() {
        expect(self.viewController.tableView.accessibilityIdentifier).toNot(beNil())
        expect(self.viewController.headerView.accessibilityIdentifier).toNot(beNil())
        expect(self.viewController.headerBody.accessibilityIdentifier).toNot(beNil())
        expect(self.viewController.headerLabel.accessibilityIdentifier).toNot(beNil())
        expect(self.viewController.separatorView.accessibilityIdentifier).toNot(beNil())
    }

    /**
     The purpose of this function to check all the IBOutlets of the tableview cell
     */
    func testCellIBOutlets() {
        let cell = viewController.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? AccordianTableViewCell ?? AccordianTableViewCell()

        expect(cell.titleLabel).toNot(beNil())
        expect(cell.accordianImageView).toNot(beNil())
    }
}
