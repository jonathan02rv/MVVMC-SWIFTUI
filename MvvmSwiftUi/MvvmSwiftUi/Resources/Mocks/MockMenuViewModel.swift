//
//  MockMenuViewModel.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 24/08/21.
//

import Foundation
import Domain

class MockMenuVieModel:MenuViewModelProtocol{
    func getAllSections() -> [MenuSectionModel] {
        return [MenuSectionModel]()
    }
    
    func getItemData(sectionId: String, idItem: String) -> MenuItemModel {
        return MenuItemModel.emptyItem
    }
    func addOrder(sectionId: String, idItem: String) {
    }
    func callServiceMenuSections() {
    }
}
