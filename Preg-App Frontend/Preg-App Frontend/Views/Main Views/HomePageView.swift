//
//  HomePageView.swift
//  Preg-App Frontend
//
//  Created by Abraham Gomez Jr on 4/11/26.
//

import SwiftUI

struct HomePageView: View {
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 1, green: 0.9435498118, blue: 0.8799069524, alpha: 1))
                .ignoresSafeArea()
            VStack {
                HStack{
                    Text("# WEEK AND # DAYS")
                        .foregroundColor(Color(#colorLiteral(red: 0.7978933454, green: 0.6680648923, blue: 0.6557773948, alpha: 1)))
                        .font(.system(size: 20, weight: .bold, design: .serif))
                    Spacer()
                        .frame(width: 130)
                }
                RoundedRectangle(cornerRadius: 20)
                    .fill((.pink.opacity(0.4)))
                    .frame(width: 350, height: 80)
                    .overlay(
                        Text("Verse").foregroundColor(.white)
                    )
                
                HStack {
                    Rectangle()
                        .fill(.black)
                        .frame(width: 160, height: 300)
                        .overlay(
                            Text("Picture").foregroundColor(.white)
                        )
                    VStack{
                        Rectangle()
                            .fill(.black)
                            .frame(width: 170, height: 95)
                            .overlay(
                                Text("Data").foregroundColor(.white)
                            )
                        Rectangle()
                            .fill(.black)
                            .frame(width: 170, height: 95)
                            .overlay(
                                Text("Data").foregroundColor(.white)
                            )
                        Rectangle()
                            .fill(.black)
                            .frame(width: 170, height: 95)
                            .overlay(
                                Text("Data").foregroundColor(.white)
                            )
                    }
                    
                }
                
                HStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill((.pink.opacity(0.4)))
                        .frame(width: 170, height: 200)
                        .overlay(
                            Text("Mom").foregroundColor(.white)
                        )
                    RoundedRectangle(cornerRadius: 20)
                        .fill((.pink.opacity(0.4)))
                        .frame(width: 170, height: 200)
                        .overlay(
                            Text("Baby").foregroundColor(.white)
                        )
                }
            }
        }
    }
}

#Preview {
    HomePageView()
}
