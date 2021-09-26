//
//  Session.swift
//  client-server-1436
//
//  Created by zeons on 16.08.2021.
//

import Foundation

final class Session{
    
    private init(){} //  Закрываем инит
    
    static let shared = Session() // Мы переиспользуем один и тот же объект
    
    var token: String = "" //Token VK
    var userId: Int = 0    //ID пользователя
}
