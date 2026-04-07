import SwiftUI

struct ListaClanakaView: View {
    let clanci: [Clanak] = Clanak.mockClanaci
    
    var body: some View {
        VStack {
            Text("Vijesti")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.largeTitle)
                .bold()
                .padding()
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(clanci) { clanak in
                        ClanakView(clanak: clanak)
                    }
                }
                .padding()
            }
        }
    }
}


#Preview {
    ListaClanakaView()
}
