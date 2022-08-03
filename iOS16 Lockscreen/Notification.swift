//
//  Notification.swift
//  iOS16 Lockscreen
//
//  Created by Nick Rice on 03/08/2022.
//

import SwiftUI

struct Notification: View {
    var body: some View {
        HStack {
            Image("notifIcon")
                .resizable()
                .mask(RoundedRectangle(cornerRadius: 16, style: .continuous))
                .frame(width: 48, height: 48)
                .padding()

            
            VStack(alignment: .leading) {
                HStack {
                    Text("iOSNick")
                        .font(.system(size: 18, weight: .bold))
                    
                    Spacer()
                    
                    Text("now")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 8)
                        .padding(.trailing, -2)
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                Text("Swipe to see more lock screens")
                    .font(.system(size: 16, weight: .regular))
                    .padding(.horizontal)
                    .padding(.top, -22)
            }
            .padding(.bottom)
            .padding(.leading, -24)
        }
        .background(.thinMaterial)
        .mask(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .padding(.horizontal, 12)
        .padding(.vertical, 12)
    }
}

struct Notification_Previews: PreviewProvider {
    static var previews: some View {
        Notification()
    }
}
