//
//  DetailContentView.swift
//  Project2
//
//  Created by BOUDIER Nicolas on 22/06/2022.
//

import SwiftUI


struct DetailContentView: View{
    
    var contact: ContactModel.Results
    
    var body: some View{
        VStack(spacing: CGFloat(20)) {
            ImageView(url: URL(string: contact.picture.large), height: 150, width: 150)
                        .clipShape(Circle())
            HStack{
                Text(contact.name.title).bold()
                Text(contact.name.first).bold()
                Text(contact.name.last).bold()
            }
            Text(contact.email)
        }
    }
}

