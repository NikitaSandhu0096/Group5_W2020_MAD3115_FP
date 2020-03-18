//
//  Person.swift
//  CarRentingSystem
//
//  Created by MacStudent on 2020-02-12.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import Foundation

enum Gender{
    case Male
    case Female
    case Others
}

protocol Person : IDisplay
{
    var id : Int { get set }
    var firstName : String { get set }
    var lastName : String { get set }
    var gender : Gender { get set }
    var birthDate : String { get set }
    var age : Int { get set }
    var mobileNumber : String { get set }
    var email : String { get set }
    var userName : String { get set }
    var password : String { get set }

    func display()
}
