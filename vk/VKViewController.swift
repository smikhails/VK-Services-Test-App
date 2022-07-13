//
//  VKViewController.swift
//  vk
//
//  Created by Mikhail on 13.07.2022.
//

import UIKit

class VKViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(UINib(nibName: "ServicesCell", bundle: nil), forCellWithReuseIdentifier: "ServicesCell")
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
}
extension VKViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
            
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return results.body.services.count
            }
            
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ServicesCell", for: indexPath) as! ServicesCell
                cell.init_cell(service: results.body.services, num:indexPath.item)
                return cell
            }
            
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                return CGSize(width: UIScreen.main.bounds.width, height: 80)
        }
    
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
                return 0
            }
            
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            collectionView.deselectItem(at: indexPath, animated: true)
            let servicelink = URL(string: results.body.services[indexPath.item].link)
            UIApplication.shared.open(servicelink ?? URL(string: "")!)
        }
}

