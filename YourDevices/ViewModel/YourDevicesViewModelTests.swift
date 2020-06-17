//
//  YourDevicesViewModelTests.swift
//  BasalMMATests
//
//  Created by Sajal Kaushik on 09/06/20.
//  Copyright © 2020 Eli Lilly and Company. All rights reserved.
//

import LillyDevice
import Nimble
import Quick
@testable import BasalMMA

/**
 The purpose of the `YourDevicesViewModelTests` is to unit test `YourDevicesViewModel`
 */
class YourDevicesViewModelTests: QuickSpec, AppConfigurable {
    var viewModel: YourDevicesViewModel!
    let mockDataRepository = MockDataRepository()
    override func spec() {
        viewModel = YourDevicesViewModel()
        describe("when Your Devices ViewModel") {
            context("Gets loaded") {
                it("vars shouldn't be empty") {
                    self.testVariables()
                }
            }
            context("Gets loaded") {
                it("flags should update based on pairing status") {
                    self.testUpdateFlags()
                }
            }
            context("Gets loaded") {
                it("dataSource should have correct values based on pairing flags") {
                    self.testDataSource()
                }
            }
        }
    }

    /**
     The purpose of this function to check if all the variables have the right initial value.
     */
    func testVariables() {
        expect(self.viewModel.navBarTitle).toNot(beNil())
        expect(self.viewModel.dataSource.isEmpty).to(beFalse())
        expect(self.viewModel.backButton).toNot(beNil())
        expect(self.viewModel.headerTitle).toNot(beNil())
        expect(self.viewModel.headerBody).toNot(beNil())
        expect(self.viewModel.helpSection).toNot(beNil())
        expect(self.viewModel.iconPath).toNot(beNil())
    }

    /**
     The purpose of this function to check if `isPenPaired` and `isBGMeterPaired` gets updated based on pairing status.
     */
    func testUpdateFlags() {
        DependencyObject.configureMockDataRepository(mockDataRepository)
        mockDataRepository.storedDeviceList.removeAll()
        let insulinDevice = BondedDeviceInfoModel(lastConnectedDate: nil, name: nil, peripheralUUID: nil, type: LillyBLEDevice.ScanDeviceTypes.insulinTransmitters.rawValue, serialNumber: nil, softwareRevision: nil, manufacturerName: nil, firmwareRevision: nil, modelNumber: nil, hardwareRevision: nil, lc3ID: nil, systemID: nil, identifier: nil)

        let bGMeter = BondedDeviceInfoModel(lastConnectedDate: nil, name: nil, peripheralUUID: nil, type: LillyBLEDevice.ScanDeviceTypes.glucoseMeters.rawValue, serialNumber: nil, softwareRevision: nil, manufacturerName: nil, firmwareRevision: nil, modelNumber: nil, hardwareRevision: nil, lc3ID: nil, systemID: nil, identifier: nil)
        mockDataRepository.storedDeviceList = [insulinDevice, bGMeter]
        viewModel.setupDataSource()
        expect(self.viewModel.dataSource[0][0].title).to(equal(staticAppConfig.settings.component.yourDevices.text.unpairedInsulinTitle()))
        expect(self.viewModel.dataSource[0][1].title).to(equal(staticAppConfig.settings.component.yourDevices.text.unpairedBGMeterTitle()))
    }

    func testDataSource() {
        viewModel.setupDataSource()
        expect(self.viewModel.dataSource[0][0].title).to(equal(staticAppConfig.settings.component.yourDevices.text.unpairedInsulinTitle()))
        expect(self.viewModel.dataSource[0][1].title).to(equal(staticAppConfig.settings.component.yourDevices.text.unpairedBGMeterTitle()))
    }
}
