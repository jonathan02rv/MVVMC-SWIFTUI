//
//  MenuView.swift
//  MvvmSwiftUi
//
//  Created by Jhonatahan Orlando Rivera Vilcapoma on 10/08/21.
//

import SwiftUI

struct MenuView<ViewModel>: View where ViewModel: MenuViewModelProtocol{
    
    @ObservedObject var viewModel: ViewModel
    let cordinator: MenuViewCordinatorProtocol
    
    init(viewModel: ViewModel, cordinator: MenuViewCordinatorProtocol) {
        self.viewModel = viewModel
        self.cordinator = cordinator
        self.viewModel.callServiceMenuSections()
    }
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.getAllSections()){ section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items){ item in
                            NavigationLink(
                                destination:
                                    cordinator.routeToDetailItem(itemMenu: item)
                                    ){
                                ItemRow(viewModel: viewModel, idItem: item.id, sectionId: section.id)
                            }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Menu", displayMode: .automatic)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(viewModel: MockMenuVieModel(), cordinator: MenuViewCordinator())
    }
}



