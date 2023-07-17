//
//  MyPostsView.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/14.
//

import SwiftUI

class RefreshControlHelper {
    
    //MARK: Properties
    var parentContentView : MyPostsView?
    var refreshControl : UIRefreshControl?
    
    @objc func didRefresh(){
        guard let parentContentView = parentContentView,
              let refreshControl = refreshControl else {
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            parentContentView.viewModel.refreshActionSubject.send()
            refreshControl.endRefreshing()
        }
    }
}

struct MyBottomProgressView: View {
    var body : some View {
        ProgressView()
            .progressViewStyle(
                CircularProgressViewStyle(tint: Color.init(#colorLiteral(red: 1, green: 0.5433388929, blue: 0, alpha: 1)))
            ).scaleEffect(1.7, anchor: .center)
    }
}



struct MyPostsView: View {
    @StateObject var viewModel: MyPostsViewModel
    private let refreshControlHelper = RefreshControlHelper()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .strokeBorder(Color.main)
                        .frame(height: 33)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                    
                    Button {
                        
                    } label: {
                        Text("전체")
                            .bold()
                            .applyInner(color: .mainColor)
                    }
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color.buttonBackground)
                        .frame(height: 33)
                        .frame(maxWidth: .infinity)
                    Button {
                        
                    } label: {
                        Text("분양중")
                            .applyInner(color: .disabledTextColor)
                    }
                    
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color.buttonBackground)
                        .frame(height: 33)
                        .frame(maxWidth: .infinity)
                    Button {
                        
                    } label: {
                        Text("분양완료")
                            .applyInner(color: .disabledTextColor)
                    }
                    
                }
                Spacer()
            }
            Text("분양중")
                .applyInner(color: .mainTextColor)
                .bold()
        }
        .padding()
        
        ScrollView {
            ForEach(viewModel.myEditPosts, id: \.postId) { info in
                MyPostsRowVIew(myPost: info)
                    .onAppear{
                        fetchMoreData(info)
                    }
            }
        }
        .navigationTitle("작성한 분양글")
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Text("프로필")
                    .onTapGesture {
                        viewModel.pop()
                    }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                    Image(systemName: "bell")
                }
            }
        }
        .onAppear {
            viewModel.getMyEditPosts()
        }
        
        if viewModel.isLoading {
            MyBottomProgressView()
        }
    }
}

extension MyPostsView {
    private func fetchMoreData(_ myPost: PostsInfoVO){
        if self.viewModel.myEditPosts.last == myPost {
            viewModel
                .fetchMoreActionSubject.send()
        }
    }
    
    private func configureRefreshControl(_ tableView: UITableView){
        let myRefresh = UIRefreshControl()
        myRefresh.tintColor = #colorLiteral(red: 1, green: 0.5433388929, blue: 0, alpha: 1)
        refreshControlHelper.refreshControl = myRefresh
        refreshControlHelper.parentContentView = self
        myRefresh.addTarget(refreshControlHelper, action: #selector(RefreshControlHelper.didRefresh), for: .valueChanged)
        tableView.refreshControl = myRefresh
    }
}
