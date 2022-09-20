//
//  ItemboxViewController.swift
//  calender
//
//  Created by 藤井玖光 on 2022/09/20.
//

import UIKit

class ItemboxViewController:  UIViewController ,UICollectionViewDataSource, UICollectionViewDelegate {
                                  
    // サムネイル画像の名前
    let photos = ["item1", "item2","item3","item4","item5"]
                                  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
                                  
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
                                      
    // "Cell" はストーリーボードで設定したセルのID
    let testCell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
                                      
    // Tag番号を使ってImageViewのインスタンス生成
    let imageView = testCell.contentView.viewWithTag(1) as! UIImageView
    // 画像配列の番号で指定された要素の名前の画像をUIImageとする
    let cellImage = UIImage(named: photos[indexPath.row])
    // UIImageをUIImageViewのimageとして設定
    imageView.image = cellImage
                                      
    return testCell
   }
                                  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
   // section数は１つ
  return 1
    }
                                  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    // 要素数を入れる、要素以上の数字を入れると表示でエラーとなる
    return photos.count;
    }
                                  
}
