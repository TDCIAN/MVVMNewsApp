//
//  Webservice.swift
//  GoodNews
//
//  Created by JeongminKim on 2022/05/27.
//

import Foundation

class Webservice {
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("getArticles - error: \(error.localizedDescription)")
                completion(nil)
            } else if let data = data {
                do {
                    let articleList = try JSONDecoder().decode(ArticleList.self, from: data).articles
                    print("아티클리스트: \(articleList)")
                    completion(articleList)
                } catch {
                    print("캐치에러: \(error)")
                }
            }
        }.resume()
    }
}
