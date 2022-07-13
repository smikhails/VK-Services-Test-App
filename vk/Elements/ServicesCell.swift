//
//  ServicesCell.swift
//  vk
//
//  Created by Mikhail on 13.07.2022.
//

import UIKit

class ServicesCell: UICollectionViewCell {

    @IBOutlet weak var serviceimg: UIImageView!
    
    @IBOutlet weak var Service_Label: UILabel!
    
    @IBOutlet weak var Service_Description: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.serviceimg.image = nil
    }
    
    func init_cell(service:[Services], num:Int){
        if let imageData = try? Data(contentsOf: URL(string: service[num].icon_url)!) {
            if let loadedImage = UIImage(data: imageData) {
                   self.serviceimg.image = loadedImage
                }
            }
        self.Service_Label.text = service[num].name
        self.Service_Description.text = service[num].description
    
    }

}
