//
//  ContentView.swift
//  PieChart
//
//  Created by Stewart Lynch on 2020-11-26.
//

import Charts
import SwiftUI

struct ContentView: View {
    @State private var pieChartEntries: [PieChartDataEntry] = []
    @State private var category: Wine.Category = .variety
    var body: some View {
        VStack {
            PieChart(entries: Wine.entriesForWines(Wine.allWines,
                                                   category: category),
                     category: $category)
                .frame(height: 400)
            Picker(selection: $category, label: Text("Category")) {
                Text("Variety").tag(Wine.Category.variety)
                Text("Winery").tag(Wine.Category.winery)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
