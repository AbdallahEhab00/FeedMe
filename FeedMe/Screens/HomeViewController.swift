//
//  HomeViewController.swift
//  FeedMe
//
//  Created by Abdallah Ehab on 07/06/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    let backgrounImage       = UIImageView()
    let bellButton           = FMButton(backgroundImage: "alarm")
    let profileButton        = FMButton(backgroundImage: "avtar")
    let welcomeLabel         = FMBodyLabel(textAlignment: .right)
    let titleHeaderLabel     = FMTitleLabel(textAlignment: .center, fontSize: 22,textColor: .purple)
    let locationLabel        = FMTitleLabel(textAlignment: .center, fontSize: 17, textColor: .orange)
    let categoryHeaderLabel  = FMTitleLabel(textAlignment: .center, fontSize: 24,textColor: .black)
    let offerHeaderLabel     = FMTitleLabel(textAlignment: .right, fontSize: 24,textColor: .black)


    let padding:CGFloat = 20
    let textElemntPadding:CGFloat = 10
    let foods:[UIImage] = [UIImage(named: "pizza")!,UIImage(named: "korean")!,UIImage(named: "grill")!,UIImage(named: "spring")!]
    
    var CategoryCollectionView:UICollectionView!
    var offerCollectionView:UICollectionView!
    var adsCollectionView:UICollectionView!
    
    let viewModel = CategoryViewModel()
    let offerviewModel = OfferViewModel()


    var pageControl : UIPageControl = UIPageControl(frame: .zero)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCategoryVM()
        configureOfferVM()
        congigureBackgrounImage()
        congigureBellButton()
        congigureProfileButton()
        configureLabels()
        configureCategoryCollectionView()
        configureAdsCollectionView()
        configurePageControl()
        configureOfferLabels()
        configureofferCollectionView()

    }
    
    func configureCategoryVM(){
        viewModel.reloadCollectionViewclosure = {  [weak self] () in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.CategoryCollectionView.reloadData()
            }
        }
        self.viewModel.getCategoryOfFood()

    }
    
    func configureOfferVM(){
        offerviewModel.reloadCollectionViewclosure = {  [weak self] () in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.offerCollectionView.reloadData()
            }
        }
        self.offerviewModel.getFoodOffers()

    }
    
    private func congigureBackgrounImage(){
        view.addSubview(backgrounImage)
        backgrounImage.image = UIImage(named: "background")
        backgrounImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
         backgrounImage.topAnchor.constraint(equalTo: view.topAnchor),
         backgrounImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         backgrounImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         backgrounImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
     }
     
     private func congigureBellButton(){
         view.addSubview(bellButton)
         NSLayoutConstraint.activate([
             bellButton.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
             bellButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: textElemntPadding),
             bellButton.heightAnchor.constraint(equalToConstant: 50),
             bellButton.widthAnchor.constraint(equalToConstant: 50)
         ])
     }
     private func congigureProfileButton(){
         view.addSubview(profileButton)
         NSLayoutConstraint.activate([
             profileButton.topAnchor.constraint(equalTo: view.topAnchor, constant: padding+15),
             profileButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
             profileButton.heightAnchor.constraint(equalToConstant: 80),
             profileButton.widthAnchor.constraint(equalToConstant: 80)
         ])
     }
     
     private func configureLabels(){
        
         let attributedText = NSMutableAttributedString(string: "استمتع باكبر مجموعه من المطاعم والعروض")
         attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: NSRange(location:0,length:6))
         
         view.addSubview(welcomeLabel)
         view.addSubview(titleHeaderLabel)
         view.addSubview(locationLabel)
         view.addSubview(categoryHeaderLabel)

         welcomeLabel.text                = "اهلا بيك، حسام"
         titleHeaderLabel.attributedText  = attributedText
         locationLabel.text               = "مدينه نصر - الحي العاشر"
         categoryHeaderLabel.text         =  "حابب تطلب ايه ؟ اختار قسمك المفضل"

         NSLayoutConstraint.activate([
             locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -textElemntPadding),
             locationLabel.centerYAnchor.constraint(equalTo: profileButton.centerYAnchor),

             
             welcomeLabel.topAnchor.constraint(equalTo: profileButton.bottomAnchor, constant: textElemntPadding),
             welcomeLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
             welcomeLabel.heightAnchor.constraint(equalToConstant: 16),
             
             titleHeaderLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: textElemntPadding),
             titleHeaderLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
             titleHeaderLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
             titleHeaderLabel.heightAnchor.constraint(equalToConstant: 23),
             
             categoryHeaderLabel.topAnchor.constraint(equalTo: titleHeaderLabel.bottomAnchor, constant: padding),
             categoryHeaderLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
             categoryHeaderLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
             categoryHeaderLabel.heightAnchor.constraint(equalToConstant: 26),
         ])
     }
     
    
    func configureCategoryCollectionView(){
        CategoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createColumnFlowLayout(view: view, itemSize: 3))
        view.addSubview(CategoryCollectionView)
        CategoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        CategoryCollectionView.delegate    = self
        CategoryCollectionView.dataSource  = self
        CategoryCollectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseID)
        NSLayoutConstraint.activate([
            CategoryCollectionView.topAnchor.constraint(equalTo: categoryHeaderLabel.bottomAnchor, constant: textElemntPadding),
            CategoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            CategoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            CategoryCollectionView.heightAnchor.constraint(equalToConstant: 185)


        ])
        
    }
    
    func configureAdsCollectionView(){
        adsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createColumnFlowLayout(view: view, itemSize: 1))
        view.addSubview(adsCollectionView)
        adsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        adsCollectionView.delegate    = self
        adsCollectionView.dataSource  = self
        adsCollectionView.register(AdsCollectionViewCell.self, forCellWithReuseIdentifier: AdsCollectionViewCell.reuseID)
        NSLayoutConstraint.activate([
            adsCollectionView.topAnchor.constraint(equalTo: CategoryCollectionView.bottomAnchor, constant: textElemntPadding),
            adsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            adsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            adsCollectionView.heightAnchor.constraint(equalToConstant: 160)
        ])
        
    }
    
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageControl.numberOfPages = 3
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = UIColor.secondaryLabel
        self.pageControl.currentPageIndicatorTintColor = UIColor.orange
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: adsCollectionView.bottomAnchor),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func configureOfferLabels(){
        view.addSubview(offerHeaderLabel)
        offerHeaderLabel.text         =  "تصفح اقوي العروض عندنا"
        NSLayoutConstraint.activate([
            offerHeaderLabel.topAnchor.constraint(equalTo: pageControl.bottomAnchor),
            offerHeaderLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            offerHeaderLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
            offerHeaderLabel.heightAnchor.constraint(equalToConstant: 26),
        ])
    }
    
    func configureofferCollectionView(){
        offerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createColumnFlowLayout(view: view, itemSize: 1.5))
        view.addSubview(offerCollectionView)
        offerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        offerCollectionView.delegate    = self
        offerCollectionView.dataSource  = self
        offerCollectionView.register(OfferCollectionViewCell.self, forCellWithReuseIdentifier: OfferCollectionViewCell.reuseID)
        NSLayoutConstraint.activate([
            offerCollectionView.topAnchor.constraint(equalTo: offerHeaderLabel.bottomAnchor,constant: textElemntPadding),
            offerCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            offerCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            offerCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
     
}

extension HomeViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case CategoryCollectionView:
            return viewModel.numberOfCell
        case adsCollectionView:
            return 3
        default:
            return offerviewModel.numberOfCell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case CategoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseID, for: indexPath)as!CategoryCollectionViewCell
            cell.categoryFoodLabel.text = viewModel.categories[indexPath.row].name
            cell.foodImageView.image = foods[indexPath.row]
            return cell
        case adsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdsCollectionViewCell.reuseID, for: indexPath)as!AdsCollectionViewCell
            collectionView.isPagingEnabled = true
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OfferCollectionViewCell.reuseID, for: indexPath)as!OfferCollectionViewCell
            let cusine = offerviewModel.offers[indexPath.row].cuisines[0].name
            cell.categoryFoodLabel.text = "\(offerviewModel.offers[indexPath.row].name)     -     \(cusine)"

            return cell
        }
       
    }
    
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = self.adsCollectionView.frame.size.width
        pageControl.currentPage = Int(self.adsCollectionView.contentOffset.x / pageWidth)
    }
}
