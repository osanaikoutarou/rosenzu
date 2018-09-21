//
//  RandomViewController.swift
//  RandomCollectionView
//
//  Created by osanai on 2018/09/20.
//  Copyright © 2018年 osanai.sample.copytesting. All rights reserved.
//

import UIKit

class RandomViewController: UIViewController {

    @IBOutlet weak var rCollectionView: UICollectionView!
    @IBOutlet weak var rScrollView: UIScrollView!
    
    @IBOutlet weak var rCollectionViewWidth: NSLayoutConstraint!
    @IBOutlet weak var rCollectionViewHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rCollectionView.delegate = self
        rCollectionView.dataSource = self
        let layout = RandomCollectionViewlayout()
        rCollectionView.setCollectionViewLayout(layout, animated: false)
        
        rScrollView.contentSize = CGSize(width: 1000, height: 2000)
        rCollectionViewWidth.constant = 1000
        rCollectionViewHeight.constant = 2000
        
    }
}

extension RandomViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: RandomCollectionViewCell.self, for: indexPath)
        cell.label1.text = String(indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        
        let cell = collectionView.cellForItem(at: indexPath)!
        let rect = cell.superview!.convert(cell.frame, to: self.rScrollView)
//        scrollToCenter(point: CGPoint(x: rect.origin.x + rect.size.width/2, y: rect.origin.y + rect.size.height/2))
        scrollToCenter(point: cell.center)
    }
    
    func scrollToCenter(point:CGPoint) {
        UIView.animate(withDuration: 0.25) {
            self.rScrollView.contentOffset = CGPoint(x: point.x - self.rScrollView.frame.size.width/2, y: point.y - self.rScrollView.frame.size.height/2)
        }
    }
}

class RandomCollectionViewlayout:UICollectionViewFlowLayout {

    // 引数で指定されたNSIndexPathに対応する装飾要素のレイアウト情報を返すメソッドです。
    // DecorationViewとは、特定のデータに紐づかず、単にUIの見た目をよくするために配置されるビジュアルエレメントのことを意味します。
    // DecorationViewについては別の機会に触れたいと思います。
    // 作成するカスタムレイアウトがDecorationViewをサポートしない場合は、このメソッドを実装する必要はありません。
//    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//    }
    
    
    
    // UICollectionViewのコンテンツがスクロールされると、現在表示されているコンテンツ領域の位置情報を引数にこのメソッドが呼び出されます。
    // このメソッドでは、更新された位置情報からレイアウト処理を再実行すべきか判断して真偽値を返します。
    // ここでYESを返すとinvalideteLayoutメソッドを呼び出したのと同じ扱いになるようです。
//    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
//    }
    
    
    
    // UICollectionView内の要素を配置するコンテンツ部のサイズを返すメソッドです。
    // UIScrollViewのcontentSizeプロパティと同じく、スクロール領域の範囲をコントロールします。
    override var collectionViewContentSize: CGSize {
        return CGSize(width: 1000, height: 2000)
    }
    
    
    
    //MARK:----
    
    // UICollectionViewLayoutAttributesクラスは
    // Collection View上の各Cellのレイアウト情報（大きさ、座標、α値などの属性情報）をCellに紐付けて取り扱いやすいようにまとめたクラスです。
    
    
    // 引数で指定されたNSIndexPathに対応する要素のレイアウト情報を返すメソッドです。
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return self.attributes(indexPath:indexPath)
    }
    
    
    
    // 引数で渡されたCGRectの範囲内に表示される要素のUICollectionViewLayoutAttributesの配列を返すメソッドです。
    // 一部分しか表示されていない要素もこのメソッドで返します。
    // このメソッドでの戻り値でUICollectionViewLayoutAttributesが返されない要素は画面上に表示されないことから、
    // UICollectionView内部ではこのメソッドの戻り値の情報を利用して、現在の表示領域周辺のみセルなどの要素を配置しているものと思われます。
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var result:[UICollectionViewLayoutAttributes] = []
        for key in self.cellFrames.keys {
            let frame = self.cellFrames[key]
            if (rect.intersects(frame!)) {
                result.append(self.attributes(indexPath: key))
            }
        }
        
        return result
    }
    
    
    // 引数で指定されたNSIndexPathに対応する補助要素のレイアウト情報を返すメソッドです。
    // SupplementaryViewはデータをUIで表現する際に補助的な役割を果たすビジュアルエレメントのことを指します。
    // UICollectionViewFlowLayoutではSupplementaryViewとしてヘッダとフッタが用意されています。
    // このメソッドの第一引数でどちらの要素であるかを示す定数値が渡されてきますので、対応する要素のレイアウト情報を返すよう実装します。
    // 作成するカスタムレイアウトがSupplementaryViewをサポートしない場合は、このメソッドを実装する必要はありません。
    // なお、あくまでSupplementaryViewとしてヘッダとフッタを定義しているのはUICollectionViewFlowLayoutの仕様のようです。
    // 現に、ヘッダとフッタを示す定数である、UICollectionElementKindSectionHeaderとUICollectionElementKindSectionFooterはUICollectionViewFlowLayout.hで定義されています。
    // これらのことから考えるSupplementaryViewはいわゆるヘッダやフッタである必要はなく、実装者の自由に定義されることが想定されているようです。
//    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//    }
    
    
    
    
}

extension RandomCollectionViewlayout {
    var cellFrames:[IndexPath:CGRect] {
        var result:[IndexPath:CGRect] = [:]
        for i in 0...99 {
            let indexPath = IndexPath(item: i, section: 0)
            let r1:CGFloat = [10,20,30,-10,-20,-30,5,4,100][i%9]
            let r2:CGFloat = [2,4,7,-6,-20,-20,9,11,100][i%9]
            let rect = CGRect(x: CGFloat(i * 100 - i*i*i/5), y: CGFloat(30 * i) + r1, width: 80 + r2, height: 80 + r2)
            result[indexPath] = rect
        }
        return result
    }
    
    func attributes(indexPath:IndexPath) -> UICollectionViewLayoutAttributes {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attributes.frame = self.cellFrames[indexPath] ?? .zero
        return attributes
    }
    
}
