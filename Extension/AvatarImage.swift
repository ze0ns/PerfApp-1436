//
//  AvatarImage.swift
//  ServiceDesk
//
//  Created by Oschepkov Aleksandr on 30.08.2021.
//

import UIKit
class avatarImage: UIImageView{
        //когда хотим добавить статические элементы
        override init(frame: CGRect) {
            super.init(frame: frame)

        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            
        }
        
        // Вызывается когда макет загружен
        override class func awakeFromNib() {
            super.awakeFromNib()
            //округляем вьюшку по краям указывая радиус
     
        }
        
        
        //Вызывается когда размеры макета подсчитаны и установлены , когда система уже подсчитала все что вы разместили на сториборд
        override func layoutSubviews() {
            super.layoutSubviews()
            layer.cornerRadius = frame.width / 2    //делаем круг
            layer.masksToBounds = true  //обрезаем по слою
            layer.borderWidth = 1
            layer.borderColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 10, height: 10)
            layer.shadowOpacity = 0.7
            layer.shadowRadius = 5
            layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor

        }
   
}
