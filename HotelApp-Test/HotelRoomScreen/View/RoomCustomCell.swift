//
//  RoomCustomCell.swift
//  HotelApp-Test
//
//  Created by Александр on 9/15/23.
//

import UIKit

class RoomCustomCell: UITableViewCell {
    
    var peculiarities: [String] = []
    
    @IBOutlet weak var nameRoomL: UILabel!
    @IBOutlet weak var priceL: UILabel!
    @IBOutlet weak var pricePer: UILabel!
    @IBOutlet weak var aboutRoomButton: UIButton!
    @IBOutlet weak var jumpToReservationVC: UIButton!
    @IBOutlet weak var peculiaritiesCollections: UICollectionView!
//    @IBOutlet weak var aboutToomL: UILabel!
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        peculiaritiesCollections.delegate = self
        peculiaritiesCollections.dataSource = self
        
        peculiaritiesCollections.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PeculiarityCell")

        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        self.selectionStyle = .none
        self.layer.cornerRadius = 12
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureAboutButton()
        configureJumpToReservation()
    }
    
    func configure(with room: Room) {
        nameRoomL.text = room.name
        priceL.text = room.price.map { String($0) }
        pricePer.text = room.pricePer
        
    }

    
    private func configureAboutButton(){
        aboutRoomButton.semanticContentAttribute = .forceRightToLeft
        
        let spacingBetweenTextAndImage: CGFloat = 4
        
        let imageEdgeInsets = UIEdgeInsets(top: 0, left: spacingBetweenTextAndImage, bottom: 0, right: -spacingBetweenTextAndImage)
        let titleEdgeInsets = UIEdgeInsets(top: 0, left: -spacingBetweenTextAndImage, bottom: 0, right: spacingBetweenTextAndImage)
        
        aboutRoomButton.imageEdgeInsets = imageEdgeInsets
        aboutRoomButton.titleEdgeInsets = titleEdgeInsets
    }
    
    private func configureJumpToReservation(){
        jumpToReservationVC.layer.cornerRadius = 15
    }
    
    @IBAction func jumpToReservationVC(_ sender: Any) {
    }
    
    
}

extension RoomCustomCell: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return peculiarities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PeculiarityCell", for: indexPath)
        return cell

    }
    
    
}
