//
//  ReservationViewController.swift
//  HotelApp-Test
//
//  Created by Александр on 9/17/23.
//

import UIKit

class ReservationViewController: UIViewController {
    
    @IBOutlet weak var infoTable: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        infoTable.dataSource = self
        infoTable.delegate = self
    }

}

extension ReservationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell1", for: indexPath)
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell2", for: indexPath)
            return cell
        }else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell3", for: indexPath) as! InfoAboutUserCell
//            cell.configure()
            return cell
        }else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell4", for: indexPath)
            return cell
        }else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell5", for: indexPath)
            return cell
        }else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell6", for: indexPath)
            return cell
        }else if indexPath.row == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell7", for: indexPath)
            return cell
        }else if indexPath.row == 7 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell8", for: indexPath)
            return cell
        }else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 120
        case 1:
            return 280
        case 2:
            return 232
        case 3:
            return 430
        case 4:
            return 58
        case 5:
            return 58
        case 6:
            return 156
        case 7:
            return 88
        default:
            return 100
        }
    }

}
