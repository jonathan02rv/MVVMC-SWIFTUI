//
//  MenuViewModel.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 23/08/21.
//

import Foundation
import Domain

protocol MenuViewModelProtocol:ObservableObject{
    func callServiceMenuSections()
    func getAllSections()->[MenuSectionModel]
    func getItemData(sectionId:String, idItem:String)->MenuItemModel
    //func addOrder(sectionId:String, idItem:String)
}

class MenuViewModel: MenuViewModelProtocol{
    //@EnvironmentObject var order: Order
    @Published var menuSections = [MenuSectionModel]()
    
    var userCaseMenu: MenuViewUseCaseProtocol
    
    init(userCaseMenu: MenuViewUseCaseProtocol) {
        self.userCaseMenu = userCaseMenu
    }
    /*
    func addOrder(sectionId:String, idItem:String){
        let item = (self.menuSections.first{$0.id == sectionId})?.items.first{$0.id == idItem}
        guard let dataItem = item else{return}
        self.order.add(item: dataItem)
    }*/
    
    func getAllSections()->[MenuSectionModel]{
        return menuSections
    }
    
    func callServiceMenuSections(){
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
    
    func getItemData(sectionId:String, idItem:String)->MenuItemModel{
        let item = (self.menuSections.first{$0.id == sectionId})?.items.first{$0.id == idItem}
        return item ?? MenuItemModel.emptyItem
    }
    
}
