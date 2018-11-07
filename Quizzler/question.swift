//
//  question.swift
//  Quizzler
//
//  Created by Yexiao Wu on 2018-11-06.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation
class Question
{
    let questionText:String
    let answer : Bool
    
    init(text:String,correctAnswer:Bool) {
       questionText = text
       answer = correctAnswer
    }
}


