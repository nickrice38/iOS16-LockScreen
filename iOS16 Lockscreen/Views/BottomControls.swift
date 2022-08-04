//
//  BottomControls.swift
//  iOS16 Lockscreen
//
//  Created by Nick Rice on 04/08/2022.
//

import SwiftUI

struct BottomControls: View {
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                Image(systemName: "flashlight.off.fill")
                    .font(.system(size: 20))
                    .frame(width: 48, height: 48)
                    .foregroundColor(.white)
                    .background(.thinMaterial)
                    .mask(Circle())
                
                Spacer()
                
                Image(systemName: "camera.fill")
                    .font(.system(size: 20))
                    .frame(width: 48, height: 48)
                    .foregroundColor(.white)
                    .background(.thinMaterial)
                    .mask(Circle())
            }
            .padding(.horizontal, 44)
            .padding(.bottom, 48)
            
//            RoundedRectangle(cornerRadius: 30)
//                .frame(width: 142, height: 6)
//                .foregroundColor(.white)
//                .padding(.bottom, 24)
        }
    }
}

struct BottomControls_Previews: PreviewProvider {
    static var previews: some View {
        BottomControls()
    }
}
