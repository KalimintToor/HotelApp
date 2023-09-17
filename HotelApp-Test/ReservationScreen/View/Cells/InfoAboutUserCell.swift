//
//  InfoAboutUserCell.swift
//  HotelApp-Test
//
//  Created by Александр on 9/17/23.
//

import UIKit

class InfoAboutUserCell: UITableViewCell {
    
    @IBOutlet weak var numberPhoneTF: UITextField!
    fileprivate var phoneMask = "+7 (___) ___-__-__"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(){
        numberPhoneTF.delegate = self
    }

}

extension InfoAboutUserCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        
        // Применяем маску к новому тексту
        let matchedText = apply(mask: phoneMask, to: newString)
        textField.text = matchedText
        
        return false // Отменяем стандартное обновление текста поля
    }
    
    func apply(mask: String, to text: String) -> String {
        var result = ""
        var index = text.startIndex
        for character in mask where index < text.endIndex {
            if character == "_" {
                result.append(text[index])
                index = text.index(after: index)
            } else {
                result.append(character)
            }
        }
        return result
    }
    
}
