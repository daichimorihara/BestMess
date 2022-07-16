////
////  NewsModel.swift
////  BestMess
////
////  Created by Daichi Morihara on 2022/07/13.
////
//
//
//
import Foundation

struct Response: Codable {

    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article]?
}

struct Article: Codable, Identifiable {
    var id = UUID().uuidString
    var title: String?
    var url: String?
    var urlToImage: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case url
        case urlToImage
    }
}






//import Foundation
//
//struct NewsResponse: Decodable {
//    let data: [News]
//}
//
//struct News: Decodable, Identifiable {
//    var id = UUID().uuidString
//    let newsURL: String?
//    let imageURL: String?
//    let title: String?
//
//    enum CodingKeys: String, CodingKey {
//        case newsURL = "news_url"
//        case imageURL = "image_url"
//        case title
//    }
//}
//
//struct JsonData {
//
//    static let data0 = """
//    {
//        "data": [
//            {
//                "news_url": "https://seekingalpha.com/article/4523221-what-is-holding-back-china-stimulus",
//                "image_url": "https://cdn.snapi.dev/images/v1/a/t/image-1316474363-1451807.jpg",
//                "title": "What Is Holding Back China Stimulus?",
//                "text": "One of the vexing questions for China watchers has been the lack of stimulus delivered, despite the maintenance of the government's 5.5% GDP target for 2022 (although there is skepticism around the ability to reach that 5.5%). One of the big challenges China faces relative to South Korea is the amount of debt it holds for the level of income.",
//                "source_name": "Seeking Alpha",
//                "date": "Thu, 14 Jul 2022 04:03:00 -0400",
//                "topics": [
//                    "paylimitwall"
//                ],
//                "sentiment": "Negative",
//                "type": "Article"
//            },
//            {
//                "news_url": "https://www.barrons.com/articles/wall-street-upbeat-growth-stocks-51657748829",
//                "image_url": "https://cdn.snapi.dev/images/v1/n/m/m02d20210325t2i1556169604w940fhfwllplsqrlynxmpeh2o0wy-738702-1451796.jpg",
//                "title": "Wall Street Chooses an Odd Time to Be Upbeat About Growth Stocks",
//                "text": "Investors have slowly been trickling back toward growth stocks. But with interest rates creeping up and a recession increasingly likely, growth may still be under pressure.",
//                "source_name": "Barrons",
//                "date": "Thu, 14 Jul 2022 03:15:00 -0400",
//                "topics": [
//                    "paywall"
//                ],
//                "sentiment": "Neutral",
//                "type": "Article"
//            },
//            {
//                "news_url": "https://seekingalpha.com/article/4523213-why-good-news-is-good-news-even-if-it-makes-the-market-go-down",
//                "image_url": "https://cdn.snapi.dev/images/v1/8/h/image-479607780-1451794.jpg",
//                "title": "Why Good News Is Good News Even If It Makes The Market Go Down",
//                "text": "Pundits often discuss bad news being good news and good news being bad news. They are referring to the phenomenon in which the market seems to move opposite the directionality of the news.",
//                "source_name": "Seeking Alpha",
//                "date": "Thu, 14 Jul 2022 03:09:17 -0400",
//                "topics": [
//                    "paylimitwall"
//                ],
//                "sentiment": "Positive",
//                "type": "Article"
//            },
//            {
//                "news_url": "https://www.foxbusiness.com/markets/nyse-senior-market-strategist-bad-inflation-data-what-means-future-fed-action",
//                "image_url": "https://cdn.snapi.dev/images/v1/v/l/aada5a43-7eb4-4140-a66c-690c8fbaa0e8-1451762.jpeg",
//                "title": "NYSE senior market strategist on 'bad' inflation data and what it means for future Fed action",
//                "text": "New York Stock Exchange Senior Market Strategist Michael Reinking weighed in on the latest inflation data, warning that more aggressive action from the Fed should be expected.",
//                "source_name": "Fox Business",
//                "date": "Thu, 14 Jul 2022 00:15:39 -0400",
//                "topics": [],
//                "sentiment": "Negative",
//                "type": "Article"
//            },
//            {
//                "news_url": "https://www.cnbc.com/2022/07/14/copper-is-key-to-electric-vehicles-wind-and-solar-power-were-short-supply.html",
//                "image_url": "https://cdn.snapi.dev/images/v1/1/0/104668861-rts1bcmp-copper-1451765.jpg",
//                "title": "A coming copper shortage could derail the energy transition, report finds",
//                "text": "Copper demand is set to soar as renewable energy like wind and solar become more popular. But there's one problem: We don't have enough.",
//                "source_name": "CNBC",
//                "date": "Thu, 14 Jul 2022 00:01:01 -0400",
//                "topics": [],
//                "sentiment": "Negative",
//                "type": "Article"
//            },
//            {
//                "news_url": "https://www.reuters.com/markets/us/dollar-resumes-relentless-rise-inflation-stokes-fed-bets-2022-07-14/",
//                "image_url": "https://cdn.snapi.dev/images/v1/4/u/m02d20220714t2i1603941710w940fhfwllplsqrlynxmpei6d029-1451748.jpg",
//                "title": "Dollar resumes relentless rise as inflation stokes Fed bets",
//                "text": "The dollar resumed its relentless rise on Thursday, driven by both expectations for faster Federal Reserve policy tightening and safe-haven flows amid growing fears of a recession.",
//                "source_name": "Reuters",
//                "date": "Wed, 13 Jul 2022 23:11:00 -0400",
//                "topics": [],
//                "sentiment": "Negative",
//                "type": "Article"
//            },
//            {
//                "news_url": "https://www.cnbc.com/2022/07/14/copper-prices-are-signaling-investors-are-negative-on-the-economy-anz.html",
//                "image_url": "https://cdn.snapi.dev/images/v1/z/g/107087883-1657684863189-gettyimages-1365773314-vcg111365682616-1451739.jpeg",
//                "title": "Copper prices are signaling that investors are bearish on the economy, strategist says",
//                "text": "Copper is seen as a leading indicator of economic health because of its use in many sectors.",
//                "source_name": "CNBC",
//                "date": "Wed, 13 Jul 2022 22:39:20 -0400",
//                "topics": [],
//                "sentiment": "Negative",
//                "type": "Article"
//            },
//            {
//                "news_url": "https://seekingalpha.com/article/4523174-strong-case-why-were-now-in-a-recession",
//                "image_url": "https://cdn.snapi.dev/images/v1/d/t/image-482367896-1451726.jpg",
//                "title": "A Strong Case Why We Are Now Likely In A Recession",
//                "text": "One perspective on Real GDP growth is simply aggregate hours worked X the output per hour worked. Aggregate hours worked in the economy is peaking, per capita has already peaked.",
//                "source_name": "Seeking Alpha",
//                "date": "Wed, 13 Jul 2022 21:40:25 -0400",
//                "topics": [
//                    "paylimitwall"
//                ],
//                "sentiment": "Negative",
//                "type": "Article"
//            },
//            {
//                "news_url": "https://www.youtube.com/watch?v=BG-uuwxHdv0",
//                "image_url": "https://cdn.snapi.dev/images/v1/0/p/0pljj-1451707.jpg",
//                "title": "Federal Reserve's Mester on Inflation, Interest Rates (Full Interview)",
//                "text": "Federal Reserve Bank of Cleveland President Loretta Mester discusses the central bank's efforts to cool inflation. US inflation hit a four-decade high last month, likely strengthening the Fed's resolve to aggressively raise interest rates.",
//                "source_name": "Bloomberg Markets and Finance",
//                "date": "Wed, 13 Jul 2022 20:47:06 -0400",
//                "topics": [],
//                "sentiment": "Negative",
//                "type": "Video"
//            },
//            {
//                "news_url": "https://invezz.com/news/2022/07/14/inflation-soars-9-1-but-attention-could-turn-to-supply-side-a-deep-dive/",
//                "image_url": "https://cdn.snapi.dev/images/v1/g/i/girl-at-gas-station-1451703.jpg",
//                "title": "Inflation soars 9.1% but attention could turn to supply-side – A Deep Dive",
//                "text": "In what has become (almost) commonplace, the US CPI headed higher once again, galloping to 9.1% on an annual basis in June and registering a 41-year high. The latest inflation print outdid both May's reading of 8.6% and the Dow Jones' forecast of 8.8%.",
//                "source_name": "Invezz",
//                "date": "Wed, 13 Jul 2022 20:47:00 -0400",
//                "topics": [],
//                "sentiment": "Neutral",
//                "type": "Article"
//            },
//            {
//                "news_url": "https://www.cnn.com/2022/07/13/business/nightcap-inflation-cpi-fed/index.html",
//                "image_url": "https://cdn.snapi.dev/images/v1/q/6/220713160243-12-jerome-powell-0615-super-169-1451701.jpg",
//                "title": "The Fed has few options as inflation runs hot",
//                "text": "Editor's Note: This story is part of CNN Business' Nightcap newsletter. To get it in your inbox, sign up for free, here.",
//                "source_name": "CNN Business",
//                "date": "Wed, 13 Jul 2022 20:38:33 -0400",
//                "topics": [],
//                "sentiment": "Negative",
//                "type": "Article"
//            },
//            {
//                "news_url": "https://www.youtube.com/watch?v=dt055-KPWFg",
//                "image_url": "https://cdn.snapi.dev/images/v1/m/q/watch-jim-cramer-break-down-charts-analysis-from-carley-garner-1451685.jpg",
//                "title": "Watch Jim Cramer break down charts analysis from Carley Garner",
//                "text": "The \"Mad Money\" host broke down fresh charts analysis from DeCarley Trading's Carley Garner on Wednesday's episode of the show.",
//                "source_name": "CNBC Television",
//                "date": "Wed, 13 Jul 2022 20:31:35 -0400",
//                "topics": [
//                    "cramer"
//                ],
//                "sentiment": "Neutral",
//                "type": "Video"
//            },
//            {
//                "news_url": "https://www.marketwatch.com/story/feds-mester-says-inflation-data-uniformly-bad-but-not-ready-to-commit-to-even-bigger-rate-hike-11657757421",
//                "image_url": "https://cdn.snapi.dev/images/v1/q/m/im-465468size1777777777777778width800-1451682.jpg",
//                "title": "Fed's Mester says inflation data ‘uniformly bad,' but not ready to commit to even bigger rate hike",
//                "text": "Federal Reserve Bank of Cleveland President Loretta Mester said inflation data released earlier Wednesday was terrible, but she wasn't yet ready to commit to further accelerating central bank interest rate rises to deal with the problem.",
//                "source_name": "Market Watch",
//                "date": "Wed, 13 Jul 2022 20:10:00 -0400",
//                "topics": [
//                    "paylimitwall"
//                ],
//                "sentiment": "Negative",
//                "type": "Article"
//            },
//            {
//                "news_url": "https://www.youtube.com/watch?v=WS7Rx5yaZno",
//                "image_url": "https://cdn.snapi.dev/images/v1/m/q/us-will-see-a-recession-if-this-happens-steve-moore-1451690.jpg",
//                "title": "US will see a recession if this happens: Steve Moore",
//                "text": "Committee to Unleash Prosperity's Steve Moore and Texas Republican Rep. Kevin Brady voice their concerns over the Build Back Better bill as Americans see record-high inflation on 'Kudlow.",
//                "source_name": "Fox Business",
//                "date": "Wed, 13 Jul 2022 20:00:08 -0400",
//                "topics": [],
//                "sentiment": "Negative",
//                "type": "Video"
//            },
//            {
//                "news_url": "https://www.youtube.com/watch?v=DM61ZDLhmZs",
//                "image_url": "https://cdn.snapi.dev/images/v1/m/q/federal-reserves-mester-cpi-data-gives-no-reason-for-smaller-hike-1451679.jpg",
//                "title": "Federal Reserve's Mester: CPI Data Gives No Reason for Smaller Hike",
//                "text": "Federal Reserve Bank of Cleveland President Loretta Mester says the latest inflation report suggested the central bank should raise rates by at least 75 basis points later this month. US inflation hit a four-decade high in June.",
//                "source_name": "Bloomberg Markets and Finance",
//                "date": "Wed, 13 Jul 2022 19:50:25 -0400",
//                "topics": [],
//                "sentiment": "Neutral",
//                "type": "Video"
//            },
//            {
//                "news_url": "https://www.youtube.com/watch?v=zkTRAyfObxk",
//                "image_url": "https://cdn.snapi.dev/images/v1/m/q/sofis-liz-young-outlook-on-inflation-earnings-1451663.jpg",
//                "title": "SoFi's Liz Young Outlook on Inflation, Earnings",
//                "text": "SoFi's Head of Investment Strategy Liz Young speaks with Emily Chang about her expectations for earnings this quarter, the CPI print, and her outlook on a potential recession.",
//                "source_name": "Bloomberg Technology",
//                "date": "Wed, 13 Jul 2022 19:43:40 -0400",
//                "topics": [
//                    "earnings"
//                ],
//                "sentiment": "Negative",
//                "type": "Video"
//            },
//            {
//                "news_url": "https://www.youtube.com/watch?v=rPTiWjSzZP4",
//                "image_url": "https://cdn.snapi.dev/images/v1/v/c/jim-cramer-explains-why-he-believes-the-fed-is-winning-its-battle-against-inflation-1451657.jpg",
//                "title": "Jim Cramer explains why he believes the Fed is winning its battle against inflation",
//                "text": "CNBC's Jim Cramer gave his thoughts on why he believes the Fed is succeeding in its efforts to tamp down inflation despite June's hotter than expected inflation data on Wednesday's episode of \"Mad Money.\"",
//                "source_name": "CNBC Television",
//                "date": "Wed, 13 Jul 2022 19:34:48 -0400",
//                "topics": [
//                    "cramer",
//                    "madmoney"
//                ],
//                "sentiment": "Positive",
//                "type": "Video"
//            },
//            {
//                "news_url": "https://www.youtube.com/watch?v=WfjgT0BiRTk",
//                "image_url": "https://cdn.snapi.dev/images/v1/k/8/charts-suggest-the-euro-could-see-a-swift-rally-and-lift-the-stock-market-with-it-says-jim-cramer-1451658.jpg",
//                "title": "Charts suggest the euro could see a 'swift rally' and lift the stock market with it, says Jim Cramer",
//                "text": "CNBC's Jim Cramer explained charts analysis from DeCarley Trading's Carley Garner on Wednesday's episode of \"Mad Money.\"",
//                "source_name": "CNBC Television",
//                "date": "Wed, 13 Jul 2022 19:34:00 -0400",
//                "topics": [
//                    "tanalysis",
//                    "cramer",
//                    "madmoney"
//                ],
//                "sentiment": "Neutral",
//                "type": "Video"
//            },
//            {
//                "news_url": "https://www.youtube.com/watch?v=YZ7FnxZd4N4",
//                "image_url": "https://cdn.snapi.dev/images/v1/m/q/inflation-is-red-hot-1451670.jpg",
//                "title": "Inflation Is Red Hot",
//                "text": "Join @tomkeene, @FerroTV & @lisaabramowicz1 for the conversations that power your day on Bloomberg TV, Bloomberg Radio & the Surveillance podcast: https://trib.al/Ym3TxyA -------- Follow Bloomberg for business news & analysis, up-to-the-minute market data, features, profiles and more: http://www.bloomberg.com Connect with us on... Twitter: https://twitter.com/business Facebook: https://www.facebook.com/bloombergbusiness Instagram: https://www.instagram.com/bloombergbusiness/",
//                "source_name": "Bloomberg Markets and Finance",
//                "date": "Wed, 13 Jul 2022 19:31:12 -0400",
//                "topics": [],
//                "sentiment": "Negative",
//                "type": "Video"
//            },
//            {
//                "news_url": "https://www.youtube.com/watch?v=jQLbJ3oPzjk",
//                "image_url": "https://cdn.snapi.dev/images/v1/k/e/the-fed-is-winning-against-inflation-despite-red-hot-june-cpi-number-jim-cramer-says-1451650.jpg",
//                "title": "The Fed is winning against inflation despite red-hot June CPI number, Jim Cramer says",
//                "text": "The \"Mad Money\" host explained why he believes inflation has peaked in Wednesday's episode of the show.",
//                "source_name": "CNBC Television",
//                "date": "Wed, 13 Jul 2022 19:26:43 -0400",
//                "topics": [
//                    "cramer",
//                    "madmoney"
//                ],
//                "sentiment": "Positive",
//                "type": "Video"
//            }
//        ]
//    }
//    """
//
//    static let data = """
//    {
//        "data": [
//            {
//                "news_url": "https://seekingalpha.com/article/4523221-what-is-holding-back-china-stimulus",
//                "image_url": "https://cdn.snapi.dev/images/v1/a/t/image-1316474363-1451807.jpg",
//                "title": "What Is Holding Back China Stimulus?",
//                "text": "One of the vexing questions for China watchers has been the lack of stimulus delivered, despite the maintenance of the government's 5.5% GDP target for 2022 (although there is skepticism around the ability to reach that 5.5%). One of the big challenges China faces relative to South Korea is the amount of debt it holds for the level of income.",
//                "source_name": "Seeking Alpha",
//                "date": "Thu, 14 Jul 2022 04:03:00 -0400",
//                "topics": [
//                    "paylimitwall"
//                ],
//                "sentiment": "Negative",
//                "type": "Article"
//            },
//            {
//                "news_url": "https://www.barrons.com/articles/wall-street-upbeat-growth-stocks-51657748829",
//                "image_url": "https://cdn.snapi.dev/images/v1/n/m/m02d20210325t2i1556169604w940fhfwllplsqrlynxmpeh2o0wy-738702-1451796.jpg",
//                "title": "Wall Street Chooses an Odd Time to Be Upbeat About Growth Stocks",
//                "text": "Investors have slowly been trickling back toward growth stocks. But with interest rates creeping up and a recession increasingly likely, growth may still be under pressure.",
//                "source_name": "Barrons",
//                "date": "Thu, 14 Jul 2022 03:15:00 -0400",
//                "topics": [
//                    "paywall"
//                ],
//                "sentiment": "Neutral",
//                "type": "Article"
//            }
//        ]
//    }
//    """
//}
//
//
//
//
//
//
//
//
//
//
////struct NewsResponse: Decodable {
////    var articles: [News]
////}
////
////struct News: Identifiable, Decodable {
////    var id: UUID { return UUID() }
////    var title: String
////    var url: String
////    var urlToImage: String?
////    var imageUrl: String {
////        return urlToImage?.replacingOccurrences(of: "http://", with: "https://") ?? "https://media.cnn.com/api/v1/images/stellar/prod/220712211217-01-rajapaksa-sri-lanka-protest-flee.jpg?c=16x9&q=w_800,c_fill"
////    }
////}
////
////struct NewsAPI {
////    static let key = "ff6783860dff4ae6a3479600f7c66a65"
////}
////
////
//
//
//
//
//
////// MARK: - Welcome
////struct NewsModel: Decodable {
////    let status: String?
////    let totalResults: Int?
////    let articles: [Article]
////}
////
////// MARK: - Article
////struct Article: Decodable, Identifiable {
////    var id = UUID().uuidString
////
////    let source: Source?
////    let author, title, description: String?
////    let url: String?
////    let urlToImage: String?
////    let publishedAt: String?
////    let content: String?
////}
////
////// MARK: - Source
////struct Source: Decodable {
////    let id: String?
////    let name: String?
////}
////
//
///*
//
// {
//     "data": [
//         {
//             "news_url": "https://seekingalpha.com/article/4523221-what-is-holding-back-china-stimulus",
//             "image_url": "https://cdn.snapi.dev/images/v1/a/t/image-1316474363-1451807.jpg",
//             "title": "What Is Holding Back China Stimulus?",
//             "text": "One of the vexing questions for China watchers has been the lack of stimulus delivered, despite the maintenance of the government's 5.5% GDP target for 2022 (although there is skepticism around the ability to reach that 5.5%). One of the big challenges China faces relative to South Korea is the amount of debt it holds for the level of income.",
//             "source_name": "Seeking Alpha",
//             "date": "Thu, 14 Jul 2022 04:03:00 -0400",
//             "topics": [
//                 "paylimitwall"
//             ],
//             "sentiment": "Negative",
//             "type": "Article"
//         },
//         {
//             "news_url": "https://www.barrons.com/articles/wall-street-upbeat-growth-stocks-51657748829",
//             "image_url": "https://cdn.snapi.dev/images/v1/n/m/m02d20210325t2i1556169604w940fhfwllplsqrlynxmpeh2o0wy-738702-1451796.jpg",
//             "title": "Wall Street Chooses an Odd Time to Be Upbeat About Growth Stocks",
//             "text": "Investors have slowly been trickling back toward growth stocks. But with interest rates creeping up and a recession increasingly likely, growth may still be under pressure.",
//             "source_name": "Barrons",
//             "date": "Thu, 14 Jul 2022 03:15:00 -0400",
//             "topics": [
//                 "paywall"
//             ],
//             "sentiment": "Neutral",
//             "type": "Article"
//         },
//         {
//             "news_url": "https://seekingalpha.com/article/4523213-why-good-news-is-good-news-even-if-it-makes-the-market-go-down",
//             "image_url": "https://cdn.snapi.dev/images/v1/8/h/image-479607780-1451794.jpg",
//             "title": "Why Good News Is Good News Even If It Makes The Market Go Down",
//             "text": "Pundits often discuss bad news being good news and good news being bad news. They are referring to the phenomenon in which the market seems to move opposite the directionality of the news.",
//             "source_name": "Seeking Alpha",
//             "date": "Thu, 14 Jul 2022 03:09:17 -0400",
//             "topics": [
//                 "paylimitwall"
//             ],
//             "sentiment": "Positive",
//             "type": "Article"
//         },
//         {
//             "news_url": "https://www.foxbusiness.com/markets/nyse-senior-market-strategist-bad-inflation-data-what-means-future-fed-action",
//             "image_url": "https://cdn.snapi.dev/images/v1/v/l/aada5a43-7eb4-4140-a66c-690c8fbaa0e8-1451762.jpeg",
//             "title": "NYSE senior market strategist on 'bad' inflation data and what it means for future Fed action",
//             "text": "New York Stock Exchange Senior Market Strategist Michael Reinking weighed in on the latest inflation data, warning that more aggressive action from the Fed should be expected.",
//             "source_name": "Fox Business",
//             "date": "Thu, 14 Jul 2022 00:15:39 -0400",
//             "topics": [],
//             "sentiment": "Negative",
//             "type": "Article"
//         },
//         {
//             "news_url": "https://www.cnbc.com/2022/07/14/copper-is-key-to-electric-vehicles-wind-and-solar-power-were-short-supply.html",
//             "image_url": "https://cdn.snapi.dev/images/v1/1/0/104668861-rts1bcmp-copper-1451765.jpg",
//             "title": "A coming copper shortage could derail the energy transition, report finds",
//             "text": "Copper demand is set to soar as renewable energy like wind and solar become more popular. But there's one problem: We don't have enough.",
//             "source_name": "CNBC",
//             "date": "Thu, 14 Jul 2022 00:01:01 -0400",
//             "topics": [],
//             "sentiment": "Negative",
//             "type": "Article"
//         },
//         {
//             "news_url": "https://www.reuters.com/markets/us/dollar-resumes-relentless-rise-inflation-stokes-fed-bets-2022-07-14/",
//             "image_url": "https://cdn.snapi.dev/images/v1/4/u/m02d20220714t2i1603941710w940fhfwllplsqrlynxmpei6d029-1451748.jpg",
//             "title": "Dollar resumes relentless rise as inflation stokes Fed bets",
//             "text": "The dollar resumed its relentless rise on Thursday, driven by both expectations for faster Federal Reserve policy tightening and safe-haven flows amid growing fears of a recession.",
//             "source_name": "Reuters",
//             "date": "Wed, 13 Jul 2022 23:11:00 -0400",
//             "topics": [],
//             "sentiment": "Negative",
//             "type": "Article"
//         },
//         {
//             "news_url": "https://www.cnbc.com/2022/07/14/copper-prices-are-signaling-investors-are-negative-on-the-economy-anz.html",
//             "image_url": "https://cdn.snapi.dev/images/v1/z/g/107087883-1657684863189-gettyimages-1365773314-vcg111365682616-1451739.jpeg",
//             "title": "Copper prices are signaling that investors are bearish on the economy, strategist says",
//             "text": "Copper is seen as a leading indicator of economic health because of its use in many sectors.",
//             "source_name": "CNBC",
//             "date": "Wed, 13 Jul 2022 22:39:20 -0400",
//             "topics": [],
//             "sentiment": "Negative",
//             "type": "Article"
//         },
//         {
//             "news_url": "https://seekingalpha.com/article/4523174-strong-case-why-were-now-in-a-recession",
//             "image_url": "https://cdn.snapi.dev/images/v1/d/t/image-482367896-1451726.jpg",
//             "title": "A Strong Case Why We Are Now Likely In A Recession",
//             "text": "One perspective on Real GDP growth is simply aggregate hours worked X the output per hour worked. Aggregate hours worked in the economy is peaking, per capita has already peaked.",
//             "source_name": "Seeking Alpha",
//             "date": "Wed, 13 Jul 2022 21:40:25 -0400",
//             "topics": [
//                 "paylimitwall"
//             ],
//             "sentiment": "Negative",
//             "type": "Article"
//         },
//         {
//             "news_url": "https://www.youtube.com/watch?v=BG-uuwxHdv0",
//             "image_url": "https://cdn.snapi.dev/images/v1/0/p/0pljj-1451707.jpg",
//             "title": "Federal Reserve's Mester on Inflation, Interest Rates (Full Interview)",
//             "text": "Federal Reserve Bank of Cleveland President Loretta Mester discusses the central bank's efforts to cool inflation. US inflation hit a four-decade high last month, likely strengthening the Fed's resolve to aggressively raise interest rates.",
//             "source_name": "Bloomberg Markets and Finance",
//             "date": "Wed, 13 Jul 2022 20:47:06 -0400",
//             "topics": [],
//             "sentiment": "Negative",
//             "type": "Video"
//         },
//         {
//             "news_url": "https://invezz.com/news/2022/07/14/inflation-soars-9-1-but-attention-could-turn-to-supply-side-a-deep-dive/",
//             "image_url": "https://cdn.snapi.dev/images/v1/g/i/girl-at-gas-station-1451703.jpg",
//             "title": "Inflation soars 9.1% but attention could turn to supply-side – A Deep Dive",
//             "text": "In what has become (almost) commonplace, the US CPI headed higher once again, galloping to 9.1% on an annual basis in June and registering a 41-year high. The latest inflation print outdid both May's reading of 8.6% and the Dow Jones' forecast of 8.8%.",
//             "source_name": "Invezz",
//             "date": "Wed, 13 Jul 2022 20:47:00 -0400",
//             "topics": [],
//             "sentiment": "Neutral",
//             "type": "Article"
//         },
//         {
//             "news_url": "https://www.cnn.com/2022/07/13/business/nightcap-inflation-cpi-fed/index.html",
//             "image_url": "https://cdn.snapi.dev/images/v1/q/6/220713160243-12-jerome-powell-0615-super-169-1451701.jpg",
//             "title": "The Fed has few options as inflation runs hot",
//             "text": "Editor's Note: This story is part of CNN Business' Nightcap newsletter. To get it in your inbox, sign up for free, here.",
//             "source_name": "CNN Business",
//             "date": "Wed, 13 Jul 2022 20:38:33 -0400",
//             "topics": [],
//             "sentiment": "Negative",
//             "type": "Article"
//         },
//         {
//             "news_url": "https://www.youtube.com/watch?v=dt055-KPWFg",
//             "image_url": "https://cdn.snapi.dev/images/v1/m/q/watch-jim-cramer-break-down-charts-analysis-from-carley-garner-1451685.jpg",
//             "title": "Watch Jim Cramer break down charts analysis from Carley Garner",
//             "text": "The \"Mad Money\" host broke down fresh charts analysis from DeCarley Trading's Carley Garner on Wednesday's episode of the show.",
//             "source_name": "CNBC Television",
//             "date": "Wed, 13 Jul 2022 20:31:35 -0400",
//             "topics": [
//                 "cramer"
//             ],
//             "sentiment": "Neutral",
//             "type": "Video"
//         },
//         {
//             "news_url": "https://www.marketwatch.com/story/feds-mester-says-inflation-data-uniformly-bad-but-not-ready-to-commit-to-even-bigger-rate-hike-11657757421",
//             "image_url": "https://cdn.snapi.dev/images/v1/q/m/im-465468size1777777777777778width800-1451682.jpg",
//             "title": "Fed's Mester says inflation data ‘uniformly bad,' but not ready to commit to even bigger rate hike",
//             "text": "Federal Reserve Bank of Cleveland President Loretta Mester said inflation data released earlier Wednesday was terrible, but she wasn't yet ready to commit to further accelerating central bank interest rate rises to deal with the problem.",
//             "source_name": "Market Watch",
//             "date": "Wed, 13 Jul 2022 20:10:00 -0400",
//             "topics": [
//                 "paylimitwall"
//             ],
//             "sentiment": "Negative",
//             "type": "Article"
//         },
//         {
//             "news_url": "https://www.youtube.com/watch?v=WS7Rx5yaZno",
//             "image_url": "https://cdn.snapi.dev/images/v1/m/q/us-will-see-a-recession-if-this-happens-steve-moore-1451690.jpg",
//             "title": "US will see a recession if this happens: Steve Moore",
//             "text": "Committee to Unleash Prosperity's Steve Moore and Texas Republican Rep. Kevin Brady voice their concerns over the Build Back Better bill as Americans see record-high inflation on 'Kudlow.",
//             "source_name": "Fox Business",
//             "date": "Wed, 13 Jul 2022 20:00:08 -0400",
//             "topics": [],
//             "sentiment": "Negative",
//             "type": "Video"
//         },
//         {
//             "news_url": "https://www.youtube.com/watch?v=DM61ZDLhmZs",
//             "image_url": "https://cdn.snapi.dev/images/v1/m/q/federal-reserves-mester-cpi-data-gives-no-reason-for-smaller-hike-1451679.jpg",
//             "title": "Federal Reserve's Mester: CPI Data Gives No Reason for Smaller Hike",
//             "text": "Federal Reserve Bank of Cleveland President Loretta Mester says the latest inflation report suggested the central bank should raise rates by at least 75 basis points later this month. US inflation hit a four-decade high in June.",
//             "source_name": "Bloomberg Markets and Finance",
//             "date": "Wed, 13 Jul 2022 19:50:25 -0400",
//             "topics": [],
//             "sentiment": "Neutral",
//             "type": "Video"
//         },
//         {
//             "news_url": "https://www.youtube.com/watch?v=zkTRAyfObxk",
//             "image_url": "https://cdn.snapi.dev/images/v1/m/q/sofis-liz-young-outlook-on-inflation-earnings-1451663.jpg",
//             "title": "SoFi's Liz Young Outlook on Inflation, Earnings",
//             "text": "SoFi's Head of Investment Strategy Liz Young speaks with Emily Chang about her expectations for earnings this quarter, the CPI print, and her outlook on a potential recession.",
//             "source_name": "Bloomberg Technology",
//             "date": "Wed, 13 Jul 2022 19:43:40 -0400",
//             "topics": [
//                 "earnings"
//             ],
//             "sentiment": "Negative",
//             "type": "Video"
//         },
//         {
//             "news_url": "https://www.youtube.com/watch?v=rPTiWjSzZP4",
//             "image_url": "https://cdn.snapi.dev/images/v1/v/c/jim-cramer-explains-why-he-believes-the-fed-is-winning-its-battle-against-inflation-1451657.jpg",
//             "title": "Jim Cramer explains why he believes the Fed is winning its battle against inflation",
//             "text": "CNBC's Jim Cramer gave his thoughts on why he believes the Fed is succeeding in its efforts to tamp down inflation despite June's hotter than expected inflation data on Wednesday's episode of \"Mad Money.\"",
//             "source_name": "CNBC Television",
//             "date": "Wed, 13 Jul 2022 19:34:48 -0400",
//             "topics": [
//                 "cramer",
//                 "madmoney"
//             ],
//             "sentiment": "Positive",
//             "type": "Video"
//         },
//         {
//             "news_url": "https://www.youtube.com/watch?v=WfjgT0BiRTk",
//             "image_url": "https://cdn.snapi.dev/images/v1/k/8/charts-suggest-the-euro-could-see-a-swift-rally-and-lift-the-stock-market-with-it-says-jim-cramer-1451658.jpg",
//             "title": "Charts suggest the euro could see a 'swift rally' and lift the stock market with it, says Jim Cramer",
//             "text": "CNBC's Jim Cramer explained charts analysis from DeCarley Trading's Carley Garner on Wednesday's episode of \"Mad Money.\"",
//             "source_name": "CNBC Television",
//             "date": "Wed, 13 Jul 2022 19:34:00 -0400",
//             "topics": [
//                 "tanalysis",
//                 "cramer",
//                 "madmoney"
//             ],
//             "sentiment": "Neutral",
//             "type": "Video"
//         },
//         {
//             "news_url": "https://www.youtube.com/watch?v=YZ7FnxZd4N4",
//             "image_url": "https://cdn.snapi.dev/images/v1/m/q/inflation-is-red-hot-1451670.jpg",
//             "title": "Inflation Is Red Hot",
//             "text": "Join @tomkeene, @FerroTV & @lisaabramowicz1 for the conversations that power your day on Bloomberg TV, Bloomberg Radio & the Surveillance podcast: https://trib.al/Ym3TxyA -------- Follow Bloomberg for business news & analysis, up-to-the-minute market data, features, profiles and more: http://www.bloomberg.com Connect with us on... Twitter: https://twitter.com/business Facebook: https://www.facebook.com/bloombergbusiness Instagram: https://www.instagram.com/bloombergbusiness/",
//             "source_name": "Bloomberg Markets and Finance",
//             "date": "Wed, 13 Jul 2022 19:31:12 -0400",
//             "topics": [],
//             "sentiment": "Negative",
//             "type": "Video"
//         },
//         {
//             "news_url": "https://www.youtube.com/watch?v=jQLbJ3oPzjk",
//             "image_url": "https://cdn.snapi.dev/images/v1/k/e/the-fed-is-winning-against-inflation-despite-red-hot-june-cpi-number-jim-cramer-says-1451650.jpg",
//             "title": "The Fed is winning against inflation despite red-hot June CPI number, Jim Cramer says",
//             "text": "The \"Mad Money\" host explained why he believes inflation has peaked in Wednesday's episode of the show.",
//             "source_name": "CNBC Television",
//             "date": "Wed, 13 Jul 2022 19:26:43 -0400",
//             "topics": [
//                 "cramer",
//                 "madmoney"
//             ],
//             "sentiment": "Positive",
//             "type": "Video"
//         }
//     ]
// }
// */
//
