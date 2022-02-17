//
//  MockMenuViewModel.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 24/08/21.
//

import Foundation
//import Domain

class MockMenuVieModel:MenuViewModelProtocol{
    func getAllSections() -> [MenuModel] {
        return [MenuModel]()
    }
    
    func getItemData(sectionId: String, idItem: String) -> ItemModel {
        return ItemModel.emptyItem
    }
    func addOrder(sectionId: String, idItem: String) {
    }
    func callServiceMenuSections() {
    }
}
