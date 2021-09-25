//
//  ContentView.swift
//  AlamoFireExamplle
//
//  Created by IOS SENAC on 9/25/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ToDosViewModel()
    var body: some View {
        VStack{
            if(viewModel.isLoading){
                ProgressView()
            }else{
                List(viewModel.toDos){ todo in
                    Text(todo.title ?? "")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
