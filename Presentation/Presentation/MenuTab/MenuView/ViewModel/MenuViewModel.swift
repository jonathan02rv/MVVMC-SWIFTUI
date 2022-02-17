//
//  MenuViewModel.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation

public protocol MenuViewModelProtocol:ObservableObject{
    func callServiceMenuSections()
    func getAllSections()->[MenuModel]
    func getItemData(sectionId:String, idItem:String)->ItemModel
}

public class MenuViewModel: MenuViewModelProtocol{
    
    @Published var menuSections = [MenuModel]()
    
    var userCaseMenu: MenuViewUseCaseProtocol
    
    init(userCaseMenu: MenuViewUseCaseProtocol) {
        self.userCaseMenu = userCaseMenu
    }

    public func getAllSections()->[MenuModel]{
        return menuSections
    }
    
    public func callServiceMenuSections(){
        userCaseMenu.getMenuSectionsService { [weak self](result) in
            switch result{
            case .success(let data):
                DispatchQueue.main.async {
                    self?.menuSections = data
                }
            case .failure(let error):
                print(error.description)
            }
        }
    }
    
    public func getItemData(sectionId:String, idItem:String)->ItemModel{
        let item = (self.menuSections.first{$0.id == sectionId})?.items.first{$0.id == idItem}
        return item ?? ItemModel.emptyItem
    }
    
}
