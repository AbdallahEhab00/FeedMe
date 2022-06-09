//
//  OfferViewModel.swift
//  FeedMe
//
//  Created by Abdallah Ehab on 09/06/2022.
//

import Foundation


class OfferViewModel {
    
    var offers:[Newoffer] = [Newoffer]()
    
    private var cellViewModel :[OfferCellViewModel] = [OfferCellViewModel]() {
        didSet{
            self.reloadCollectionViewclosure()
        }
    }
    
    var numberOfCell : Int {
        return cellViewModel.count
    }
    
    func getCellViewModel (at indexPath:IndexPath)-> OfferCellViewModel {
        return cellViewModel[indexPath.row]
    }
    
    var reloadCollectionViewclosure : ()->()={}
    
    // Services Functions process
    func getFoodOffers(){
        NetworkManager.shared.getOffers { result in
            switch result{
            case .success(let offer):
                self.processFetchNewOffer(offers: offer)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    private func processFetchNewOffer(offers:[Newoffer]){
        self.offers = offers
        var vms = [OfferCellViewModel]()
        for offer in offers {
            vms.append(createViewModelCell(offers: offer))
        }
        self.cellViewModel = vms
    }
    
    private func createViewModelCell(offers:Newoffer)->OfferCellViewModel{
        return OfferCellViewModel(resturantName: offers.name, disscount: offers.cuisines[0].name)
    }


}
