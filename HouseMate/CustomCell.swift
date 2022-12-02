//
//  CustomCell.swift
//  HouseMate
//
//  Created by Qian Ni on 12/1/22.
//

import Foundation

import SwiftUI

struct CustomCell: View {
    var imageName: String
    
    var personName: String
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
            
            Text(personName)
                .padding(.leading, 10)
            
            
        }
    }
}

