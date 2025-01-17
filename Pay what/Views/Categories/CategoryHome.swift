/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view showing featured landmarks above a list of landmarks grouped by category.
*/

import SwiftUI

struct Ocean: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

private var oceans = [
    Ocean(name: "Pacific"),
    Ocean(name: "Atlantic"),
    Ocean(name: "Indian"),
    Ocean(name: "Southern"),
    Ocean(name: "Arctic")
]

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var multiSelection = Set<UUID>()
    @State private var showingProfile = false
    
    var body: some View {
        NavigationSplitView {
            VStack {
//                List(oceans, selection: $multiSelection) {
//                    Text($0.name)
//                }
//                .toolbar { EditButton() }
                List {
//                    modelData.features[0].image
//                        .resizable()
//                        .scaledToFill()
//                        .frame(height: 200)
//                        .clipped()
//                        .listRowInsets(EdgeInsets())
                    
                    PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                        .listRowInsets(EdgeInsets())
                    
                    ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, items: modelData.categories[key]!)
                    }
                    .listRowInsets(EdgeInsets())
                }
                .listStyle(.inset)
                .navigationTitle("Featured")
                .toolbar {
                    Button {
                        showingProfile.toggle()
                    } label: {
                        Label("User Profile", systemImage: "person.crop.circle")
                    }
                }
                .sheet(isPresented: $showingProfile) {
                    ProfileHost()
                        .environment(modelData)
                }
            }
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
