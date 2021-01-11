//
//  RemoteImage.swift
//  UK Parliment Stats
//
//  Created by Henry Hudson on 07/01/2021.
//

import SwiftUI

struct RemoteImage: View {
    private enum LoadState {
        case loading,
             success,
             failure
    }
    
    private class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading
        
        init(url: String) {
            guard let parsedURL = URL(string: url) else {
                fatalError("Invalid URL: \(url)")
            }
            
            URLSession.shared.dataTask(with: parsedURL) { data, response, error in
                if let data = data, data.count > 0 {
                    self.data = data
                    self.state = .success
                } else {
                    self.state = .failure
                }
                
                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }
            .resume()
        }
    }
    
    @StateObject private var loader: Loader
    
    var loading: Image
    var failure: Image
    
    // MARK: Body
    var body: some View {
        selectImage()
            .resizable()
    }
    
    init(url: String, loading: Image = Image(systemName: "photo"), failure: Image = Image(systemName: "multiply.circle")) {
        _loader = StateObject(wrappedValue: Loader(url: url))
        self.loading = loading
        self.failure = failure
    }
    
    private func selectImage() -> Image {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        default:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
            } else {
                return failure
            }
            
        }
    }
    
}
struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(url: "https://media.bitcoinfiles.org/5e44fd1c8ab118e696578ad45972c610293cedbba02dda11eb6e02608230fb71")
            .aspectRatio(contentMode: .fit)
            .frame(width: 300)
    }
}
