//
//  ImageViewContainer.swift
//  NYTimesArticle
//
//  Created by AAPNA on 15/07/20.
//  Copyright © 2020 Algoworks. All rights reserved.
//

import Foundation
import SwiftUI

struct ImageViewContainer: View{
   @ObservedObject var remoteImageUrl : RemoteImageURL
    
    init(imageUrl : String){
        remoteImageUrl = RemoteImageURL(imageUrl: imageUrl)
   }
    
    var body: some View{
        Image(uiImage: (remoteImageUrl.data.isEmpty ? UIImage(named: "Preview") : UIImage(data: remoteImageUrl.data))! )
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}
