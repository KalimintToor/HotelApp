//
//  ViewController.swift
//  HotelApp-Test
//
//  Created by Александр on 9/11/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var wellcomeScreenView: UIView!
    
    //MARK: - Первая ячейка информации
    
    @IBOutlet weak var cellView: UIView!
    
    @IBOutlet weak var imageHotelCollectionV: UICollectionView!
    
    
    @IBOutlet weak var ratingL: UILabel!
    @IBOutlet weak var adressL: UILabel!
    @IBOutlet weak var priceL: UILabel!
    @IBOutlet weak var ratingNameL: UILabel!
    @IBOutlet weak var priceForItL: UILabel!
    
    @IBOutlet weak var ratingImage: UIImageView!
    @IBOutlet weak var ratingView: UIView!
    
    
    //MARK: - Вторая ячейка информации
    
    @IBOutlet weak var cellView2: UIView!
    
    @IBOutlet weak var about1L: UILabel!
    @IBOutlet weak var about2L: UILabel!
    @IBOutlet weak var about3L: UILabel!
    @IBOutlet weak var about4L: UILabel!
    
    @IBOutlet weak var abouView1: UIView!
    @IBOutlet weak var aboutView2: UIView!
    @IBOutlet weak var aboutView3: UIView!
    @IBOutlet weak var aboutView4: UIView!
    
    @IBOutlet weak var aboutTable: UIStackView!
    
    @IBOutlet weak var descriptionL: UILabel!
    
    
    //MARK: - Третья ячейка информации
    
    @IBOutlet weak var cellView3: UIView!
    @IBOutlet weak var nextVCButton: UIButton!
    
    
    private let viewModel = NameHotelViewModel()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        configureUI()
        configureAboutCellUI()
        setButtonViewRadius(view: cellView3)
        
        imageHotelCollectionV.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseIdentifier)
        
        imageHotelCollectionV.dataSource = self
        imageHotelCollectionV.delegate = self
        
    }
    
    @IBAction func jumpNextScreen(_ sender: Any) {
        let vc = UIStoryboard(name: "HotelRoom", bundle: Bundle.main).instantiateViewController(withIdentifier: "HotelRoom") as? HotelRoomViewComtroller
        navigationController?.pushViewController(vc!, animated: true)
        print("tap")

    }
    
    
}

//MARK: -UPDATE Первая ячейка

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getImageUrlsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseIdentifier, for: indexPath) as! CollectionViewCell
        viewModel.loadImage(at: indexPath.row) { image in
            guard let image = image else {return}
            cell.imageHotel.image = image
        }
        return cell
    }
    
    
    private func configureUI() {
        setViewRadius(view: cellView)
        navigationController?.navigationBar.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        wellcomeScreenView.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.976, alpha: 1)
        viewModel.fetchData {
            DispatchQueue.main.async {
                self.updateInterface()
            }
        }

    }
    private func setViewRadius(view: UIView) {
        view.layer.cornerRadius = 12

        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        ratingView.backgroundColor = UIColor(red: 1, green: 0.78, blue: 0, alpha: 0.2)
        ratingView.layer.cornerRadius = 5
        ratingImage.tintColor = UIColor(red: 1, green: 0.66, blue: 0, alpha: 1)
        ratingL.textColor = UIColor(red: 1, green: 0.66, blue: 0, alpha: 1)
        ratingNameL.textColor = UIColor(red: 1, green: 0.66, blue: 0, alpha: 1)
        
        
    }
    
    private func updateInterface() {
        ratingL.text = String(viewModel.getRating() ?? 0)
        ratingNameL.text = String(viewModel.getRatingName() ?? "")
        adressL.text = String(viewModel.getAdress() ?? "")
        priceL.text = "\(viewModel.getPrice() ?? 0)"
        priceForItL.text = viewModel.getPriceForIt()
        
//        viewModel.loadImage { [weak self] image in
//            DispatchQueue.main.async {
//                self?.imageHotel.image = image
//            }
//        }
    }
    
}

//MARK: -UPDATE Вторая ячейка

extension ViewController {
    private func configureAboutCellUI() {
        setViewAboutCellRadius(view: cellView2)
        aboutTable.backgroundColor = UIColor(red: 0.984, green: 0.984, blue: 0.988, alpha: 1)
        viewModel.fetchData {
            DispatchQueue.main.async {
                self.updateAboutCellInterface()
            }
        }
    }
    
    private func setViewAboutCellRadius(view: UIView) {
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        aboutTable.layer.cornerRadius = 15
        aboutTable.backgroundColor = UIColor(red: 0.984, green: 0.984, blue: 0.988, alpha: 1)
        
        abouView1.layer.cornerRadius = 5
        abouView1.backgroundColor = UIColor(red: 0.984, green: 0.984, blue: 0.988, alpha: 1)
        
        aboutView2.layer.cornerRadius = 5
        aboutView2.backgroundColor = UIColor(red: 0.984, green: 0.984, blue: 0.988, alpha: 1)

        aboutView3.layer.cornerRadius = 5
        aboutView3.backgroundColor = UIColor(red: 0.984, green: 0.984, blue: 0.988, alpha: 1)

        aboutView4.layer.cornerRadius = 5
        aboutView4.backgroundColor = UIColor(red: 0.984, green: 0.984, blue: 0.988, alpha: 1)
        
        

    }
    
    private func updateAboutCellInterface() {
        if let peculiarities = viewModel.getPeculiarities() {
            if peculiarities.count >= 4 {
                about1L.text = peculiarities[1]
                about2L.text = peculiarities[0]
                about3L.text = peculiarities[2]
                about4L.text = peculiarities[3]
            }
        }
        
        descriptionL.text = viewModel.getDescriptionHotel()
    }
    
}

extension ViewController {
    
    private func setButtonViewRadius(view: UIView) {
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        wellcomeScreenView.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.976, alpha: 1)
        
        nextVCButton.layer.cornerRadius = 15
        
    }
}
