//
//  CategoryViewModel.swift
//  FeedMe
//
//  Created by Abdallah Ehab on 09/06/2022.
//

import Foundation

class CategoryViewModel {
    
    var categories:[Category] = [Category]()
    
    private var cellViewModel :[CategoryCellViewModel] = [CategoryCellViewModel]() {
        didSet{
            self.reloadCollectionViewclosure()
        }
    }
    
    var numberOfCell : Int {
        return cellViewModel.count
    }
    
    func getCellViewModel (at indexPath:IndexPath)-> CategoryCellViewModel {
        return cellViewModel[indexPath.row]
    }
    
    var reloadCollectionViewclosure : ()->()={}
    
    // Services Functions process
    func getCategoryOfFood(){
        NetworkManager.shared.getCategory { result in
            switch result{
            case .success(let categories):
                self.processFetchCategories(categories: categories)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
       
    }
    
    
    private func processFetchCategories(categories:[Category]){
        self.categories = categories
        var vms = [CategoryCellViewModel]()
        for category in categories {
            vms.append(createViewModelCell(categories: category))
        }
        self.cellViewModel = vms
    }
    
    private func createViewModelCell(categories:Category)->CategoryCellViewModel{
        return CategoryCellViewModel(categoryName: categories.name)
    }


}
