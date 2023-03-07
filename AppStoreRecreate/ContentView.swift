//
//  ContentView.swift
//  AppStoreRecreate
//
//  Created by 村中光一 on 2023/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                heading
                
                featuredCard
                    .padding(.horizontal, 16)
                    .padding(.bottom, 10)
                
                appListCard
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
            }
        }
        

    } // body
        
                
    var heading: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0.0) {
                Text("2月25日 土曜日" .uppercased())
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .fontWeight(.medium)
                Text("Today")
                    .font(.title)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Image("profile-blue")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
        }
        .padding(16)
        
    } // heading
    
    var featuredCard: some View {
        VStack(spacing: 0.0) {
            // 画像のヘッダー
            ZStack(alignment: .topLeading) {
                Image("pokemon-go")
                    .resizable()
                    .frame(height: 300)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                
                VStack(alignment: .leading) {
                    Text("Try Something New".uppercased())
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                    
                    Text("ホウエン地方で出会う新たなポケモンたち")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
                .padding(16)
                
            }
            
            // アイコン・テキスト・ボタン
            HStack {
                Image("pokemongo-appicon")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    Text("Pokemon GO")
                        .font(.system(size: 16, weight: .medium, design: .default))
                        .foregroundColor(.white)
                    Text("世界中でポケモンを見つけよう")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Button {
                    print("ボタンが押されました")
                } label: {
                    Text("開く" .uppercased())
                        .fontWeight(.medium)
                        .font(.system(size: 14))
                        .tint(.blue)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 14)
                    
                }
                .background(Color.white)
                .clipShape(Capsule())
                
            }
            .padding(16)
        }
        .background(Color.teal)
        .cornerRadius(18)
        
    } // featuredCard
    
    
    // アプリリストのカード
    var appListCard: some View {
        
        VStack {
            // Heading
            HStack {
                VStack(alignment: .leading) {
                    Text("トレンド")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                    Text("人気のApp")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
            
            // App List
            VStack {
                CardRowView(iconName: "AmazonPrimeIcon", appName: "Amazon Prime Video", tagline: "Originals, movies, TV, sports", hasBeenDownloadedBefore: true)
                
                Divider()
                
                CardRowView(iconName: "LINEIcon", appName: "LINE", tagline: "ソーシャルネットワーキング", hasBeenDownloadedBefore: true)
                
                Divider()
                
                CardRowView(iconName: "DoraemonAppIcon", appName: "ドラえもんチャンネルアプリ", tagline: "エンターテインメント")
                
                Divider()
                
                CardRowView(iconName: "DisneyAppIcon", appName: "Disney+", tagline: "Unlimited entertainment")
                
            }
        }
        .padding()
        .background(Color.black)
        .cornerRadius(17)
        
    } // appListCard
    
    
} // ContentView


struct CardRowView: View {
    
    let iconName: String
    let appName: String
    let tagline: String
    var hasBeenDownloadedBefore: Bool = false
    
    
    var body: some View {
        
        HStack {
            // アイコン画像
            Image(iconName)
                .resizable()
                .frame(width: 50, height: 50)
                .background(Color.white)
                .cornerRadius(9)
                .aspectRatio(contentMode: .fill)
                .clipped()
            
            //アプリ名とタグライン
            VStack(alignment: .leading) {
                Text(appName)
                    .font(.system(size: 15.5, weight: .medium, design: .default))
                    .foregroundColor(.white)
                Text(tagline)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(spacing: 5.0) {
                Button {
                    print("Get \(appName)")
                } label: {
                    // ダウンロード済みのときのボタン表示（Label）
                    if hasBeenDownloadedBefore {
                        Image(systemName: "icloud.and.arrow.down")
                            .tint(.blue)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 5)
                            .font(.system(size: 20, design: .default))
                    } else {
                        // 一度もダウンロードしていないときのボタン表示（Label）
                        Text("入手" .uppercased())
                            .fontWeight(.medium)
                            .font(.system(size: 13))
                            .tint(.white)
                            .padding(.vertical, 5)
                            .padding(.horizontal, 14)
                            .background(Color.secondary)
                            .clipShape(Capsule())
                    }
                } // Button+Label
                
                if !hasBeenDownloadedBefore {
                    Text("App内課金")
                        .font(.system(size: 9, weight: .regular, design: .default))
                        .foregroundColor(.gray)
                }
                
            }
            
        } // HStack
        .padding(.vertical, 5)
        
    } // body
    
} // CardRowView



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


