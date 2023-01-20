//
//  MemorizeTabBarView.swift
//  Memorize v2 Design
//
//  Created by Kuba Milcarz on 1/20/23.
//

import SwiftUI

struct MemorizeTabBarView: View {
    @EnvironmentObject var vm: ContentView.ViewModel
    
    let tabs: [MemorizeTabBarItem]
    @Binding var selection: MemorizeTabBarItem
    
    @Namespace private var tabBarNamespace
    @State private var localSelection: MemorizeTabBarItem
        @State private var offset = CGSize.zero
    
    init(tabs: [MemorizeTabBarItem], selection: Binding<MemorizeTabBarItem>) {
        self.tabs = tabs
        self._selection = selection
        self._localSelection = State(wrappedValue: selection.wrappedValue)
    }
    
    var body: some View {
        tabBarVersion1
            .onChange(of: selection) { value in
                withAnimation(.easeInOut(duration: 0.2)) {
                    localSelection = value
                }
            }
    }
}

extension MemorizeTabBarView {
    
    private func tabView(tab: MemorizeTabBarItem) -> some View {
        VStack(spacing: 5) {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.memorizeTabBar)
        }
        .foregroundColor(localSelection == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(tab.color.opacity(localSelection == tab ? 0.2 : 0.001))
        .cornerRadius(12)
    }
    
    private var tabBarVersion1: some View {
        VStack(spacing: 0) {
            if vm.tabBarCollapseLevel == .high {
                Capsule()
                    .fill(.secondary)
                    .frame(width: 50, height: 4)
                    .padding(.top, 5)
                    .padding(.bottom, 15)
            }
            
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    tabView(tab: tab)
                        .onTapGesture {
                            switchToTab(tab: tab)
                        }
                }
            }
            .opacity(vm.tabBarCollapseLevel == .high ? 0 : 1)
            
            Rectangle().fill(Color.clear).frame(height: 700)
        }
        .padding(6)
        .background(Material.regular, in: RoundedRectangle(cornerRadius: 12))
        .ignoresSafeArea(edges: .bottom)
        .overlay(
            RoundedRectangle(cornerRadius: 14).strokeBorder(.secondary.opacity(0.1), lineWidth: 2)
                .padding(.horizontal, -2)
        )
        .offset(x: 0, y: 700 + offset.height + (vm.tabBarCollapseLevel == .high ? 60 : vm.tabBarCollapseLevel == .medium ? 0 : -200))
        .onTapGesture {
            withAnimation(.interpolatingSpring(stiffness: 300, damping: 20)) {
                vm.tabBarCollapseLevel = vm.tabBarCollapseLevel == .high ? .medium : .high
            }
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    withAnimation(.interpolatingSpring(stiffness: 200, damping: 20)) {
                        
                        if offset.height > 20 {
                            vm.tabBarCollapseLevel = .high
                        }
                        
                        if offset.height <= 0 {
                            vm.tabBarCollapseLevel = .medium
                        }
                        
                        offset = .zero
                    }
                }
        )
    }
    
    private func switchToTab(tab: MemorizeTabBarItem) {
        selection = tab
    }
}

extension MemorizeTabBarView {
    
    private func tabView2(tab: MemorizeTabBarItem) -> some View {
        VStack(spacing: 5) {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .serif))
        }
        .foregroundColor(localSelection == tab ? tab.color : .gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rectangle", in: tabBarNamespace)
                } else {
                    Color.accentColor.opacity(0.001)
                }
            }
        )
    }
    
    private var tabBarVersion2: some View {
        ZStack {
            HStack {
                ForEach(tabs, id: \.self) { tab in
                    tabView2(tab: tab)
                        .onTapGesture {
                            switchToTab(tab: tab)
                        }
                }
            }
            .padding(5)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.background)
//                Color.primary.ignoresSafeArea(edges: .bottom)
            )
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
            .padding(.horizontal)
            .offset(x: 0, y: 5)
        }
    }
    
}
