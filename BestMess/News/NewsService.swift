//
//  NewsService.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/12.
//

import Foundation

class NewsService {
    
    func fetchNews() throws -> [News] {
        let data = Data(JsonData.data.utf8)
        
        do {
            print(data)
            
            return try JSONDecoder().decode(NewsResponse.self, from: data).data
        } catch  {
            print(data)
            print(error)
            throw error
        }
    }

 
}

// https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ff6783860dff4ae6a3479600f7c66a65





//class NewsService {
//
//
//    func fetchNews() async throws -> [Article] {
//        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ff6783860dff4ae6a3479600f7c66a65"
//        guard let url = URL(string: urlString) else {
//            print("url is bad")
//            throw URLError(.badURL)
//        }
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//
//            if let decoded = try? JSONDecoder().decode(NewsModel.self, from: data) {
//                return decoded.articles
//            } else {
//                print("url is bad 1")
//                throw URLError(.badURL)
//            }
//        } catch  {
//            print("url is bad 2")
//            throw error
//        }
//    }
//    func fetchJSONNews() -> NewsModel? {
//        let jsonString = """
//        {"status":"ok","totalResults":70,"articles":[{"source":{"id":null,"name":"CNBC"},"author":"Evelyn Cheng","title":"Chinese companies are going global as growth slows at home - CNBC","description":"Some Chinese consumer brands are looking for growth overseas, in markets like the U.S. and Southeast Asia.","url":"https://www.cnbc.com/2022/07/12/chinese-companies-look-to-us-and-asia-as-growth-slows-at-home.html","urlToImage":"https://image.cnbcfm.com/api/v1/image/107086643-1657511858035-MINISO_SoHo_Flagship_Store.jpg?v=1657512368&w=1920&h=1080","publishedAt":"2022-07-13T02:00:00Z","content":"Miniso opened its first flagship store in New York City's SoHo in February 2022.\r\nBEIJING Some Chinese consumer brands are looking for growth overseas, in markets like the U.S. and Southeast Asia.\r\nT… [+5733 chars]"},{"source":{"id":null,"name":"Rolling Stone"},"author":"Nikki McCann Ramirez","title":"Trump Has Been Fuming About ‘Sloppy,’ ‘Idiot’ Elon Musk for Months - Rolling Stone","description":"The former president has spent the past few days bashing the billionaire in public. He's been doing it privately for far longer, sources tell Rolling Stone","url":"https://www.rollingstone.com/politics/politics-news/trump-elon-musk-feud-1382154/","urlToImage":"https://www.rollingstone.com/wp-content/uploads/2022/07/EMDT.jpg","publishedAt":"2022-07-13T01:28:48Z","content":"There are no two rich narcissists better poised for a public feud than former President Donald Trump and Tesla billionaire Elon Musk, who have been trading barbs following reports that Musk wants to … [+4384 chars]"},{"source":{"id":"wired","name":"Wired"},"author":"Louryn Strampe, Gear Team","title":"17+ Best Target Deal Days Sales 2022: The Best Deals We Found - WIRED","description":"Amazon Prime Day isn't the only sale this week. From video games to household essentials, here are our favorite picks from Target’s big Deal Days sale of 2022.","url":"https://www.wired.com/story/target-deal-days-2022-prime-day-sale-1/","urlToImage":"https://media.wired.com/photos/62cc720dd8350505ad2d7c11/191:100/w_1280,c_limit/Box-B_Target.png","publishedAt":"2022-07-13T00:47:00Z","content":"There's no place like Target. While shopping online doesn't instill the same frenzy as getting lost in Bullseye's Playground, the Target Deal Days sale still offers an exciting excuse to browse the v… [+9410 chars]"},{"source":{"id":null,"name":"CNBC"},"author":"MacKenzie Sigalos","title":"New York judge freezes assets of Three Arrows Capital as crypto firm's founders remain underground - CNBC","description":"A federal judge in a New York bankruptcy court has frozen the remaining assets of crypto hedge fund Three Arrows Capital.","url":"https://www.cnbc.com/2022/07/12/new-york-judge-freezes-assets-of-three-arrows-capital.html","urlToImage":"https://image.cnbcfm.com/api/v1/image/107059229-1652254397677-gettyimages-1016927674-648a8254.jpeg?v=1657128030&w=1920&h=1080","publishedAt":"2022-07-13T00:31:00Z","content":"A federal judge in a New York bankruptcy court has frozen the remaining assets of crypto hedge fund Three Arrows Capital following the firm's rapid fall from prominence.\r\nThe fund, founded nearly a d… [+3964 chars]"},{"source":{"id":null,"name":"YouTube"},"author":null,"title":"Ice cream pop-up wants you to 'Eat the Rich' - KTLA 5","description":"The art group,  MSCHF, known for their creative and custom fashion designs is bringing a limited time pop-experience to both Los Angelenos and New Yorkers th...","url":"https://www.youtube.com/watch?v=nAOiJEKGy1E","urlToImage":"https://i.ytimg.com/vi/nAOiJEKGy1E/hqdefault.jpg","publishedAt":"2022-07-13T00:27:38Z","content":null},{"source":{"id":null,"name":"CNBC"},"author":"Jennifer Elias","title":"Google CEO Pichai says company will slow hiring through 2023 in memo to employees - CNBC","description":"Sundar Pichai, Google's CEO, told employees that the company will slow the pace of hiring and investments through next year.","url":"https://www.cnbc.com/2022/07/12/google-says-it-will-slow-hiring-through-2023-in-memo-to-employees.html","urlToImage":"https://image.cnbcfm.com/api/v1/image/107073775-1654806480914-gettyimages-1401984594-_m013305_b5de3d64-4356-4098-a909-aa35a9b6a446.jpeg?v=1654806581&w=1920&h=1080","publishedAt":"2022-07-12T23:58:11Z","content":"Google parent Alphabet will slow the pace of hiring and investments through 2023, CEO Sundar Pichai said in an email to employees on Tuesday.\r\nLike all companies, were not immune to economic headwind… [+1839 chars]"},{"source":{"id":null,"name":"New York Post"},"author":"Erin Keller","title":"Toxic weed killer found in most people's urine, shocking study finds - New York Post ","description":"The study involved 2,310 people meant to represent the American population. One-third of those involved were kids ranging in age from 6 to 18.","url":"https://nypost.com/2022/07/12/toxic-weed-killer-found-in-most-peoples-urine-study-finds/","urlToImage":"https://nypost.com/wp-content/uploads/sites/2/2022/07/toxic-weedkiller-355.jpg?quality=75&strip=all&w=1024","publishedAt":"2022-07-12T23:42:00Z","content":"A weed killer called glyphosate and sold as Roundup has been found in urine samples of 80 percent of participants in a study. \r\nA report published by the Centers for Disease Control and Prevention in… [+1566 chars]"},{"source":{"id":null,"name":"CoinDesk"},"author":"Aoyon Ashraf","title":"Celsius is 'Deeply Insolvent,' Alleges Vermont Department of Financial Regulation - CoinDesk","description":"The troubled lender lacks the assets and liquidity to honor its obligations to investors, DFR said.","url":"https://www.coindesk.com/business/2022/07/12/celsius-is-deeply-insolvent-alleges-vermont-department-of-financial-regulation/","urlToImage":"https://www.coindesk.com/resizer/E51gI3F8u2AEQB2W6TEW_cPgeak=/1200x628/center/middle/cloudfront-us-east-1.images.arcpublishing.com/coindesk/UPWYIPJPJFA4THOLDEZH2DMKWA.jpg","publishedAt":"2022-07-12T23:37:00Z","content":"Celsius Network, the troubled crypto lender, is deeply insolvent, alleged the U.S. state of Vermonts Department of Financial Regulation (DFR), noting that the lender lacks the assets and liquidity to… [+2041 chars]"},{"source":{"id":"reuters","name":"Reuters"},"author":null,"title":"Twitter sues Elon Musk to hold him to $44 billion deal - Reuters","description":"Twitter Inc <a href=\"https://www.reuters.com/companies/TWTR.N\" target=\"_blank\">(TWTR.N)</a> sued Elon Musk on Tuesday for violating his $44 billion deal to buy the social media platform and asked a Delaware court to order the world's richest person to complet…","url":"https://www.reuters.com/technology/twitter-sues-elon-musk-hold-him-44-bln-merger-2022-07-12/","urlToImage":"https://www.reuters.com/resizer/DW0dmXmtuUery6ghKTA4oNaxDWI=/728x381/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/EDE5MKZAJBMZFJY46AXVGDIPUM.jpg","publishedAt":"2022-07-12T23:33:00Z","content":"WILMINGTON, Del., July 12 (Reuters) - Twitter Inc (TWTR.N) sued Elon Musk on Tuesday for violating his $44 billion deal to buy the social media platform and asked a Delaware court to order the world'… [+4401 chars]"},{"source":{"id":null,"name":"Fox Business"},"author":"Sarah Rumpf","title":"Apple fined by Russian court for refusing to store user iCloud data in Russia - Fox Business","description":"A Moscow court on Tuesday fined Apple 2 million rubles (about $34,000) for refusing to store the personal data of Russian users on servers in Russia.","url":"https://www.foxbusiness.com/technology/russia-fines-apple-violating-data-storage-law","urlToImage":"https://a57.foxnews.com/static.foxbusiness.com/foxbusiness.com/content/uploads/2020/02/0/0/broken-iphone-Getty.jpg?ve=1&tl=1","publishedAt":"2022-07-12T23:01:11Z","content":"Russian authorities have fined Apple Inc. 2 million rubles ($33,900) for allegedly breaking the law that requires local users' iCloud data to be stored on servers within Russia, part of government ef… [+2752 chars]"},{"source":{"id":null,"name":"YouTube"},"author":null,"title":"It's do or die for Amazon this Prime Day, says former Walmart U.S. CEO - CNBC Television","description":"Former Walmart CEO Bill Simon on Amazon's 7th Prime Day kickoff. With CNBC's Melissa Lee and the Fast Money traders, Tim Seymour, Guy Adami, Karen Finerman a...","url":"https://www.youtube.com/watch?v=tQxSt5k-YCc","urlToImage":"https://i.ytimg.com/vi/tQxSt5k-YCc/hqdefault.jpg","publishedAt":"2022-07-12T22:59:12Z","content":null},{"source":{"id":"cnn","name":"CNN"},"author":"Chris Isidore, CNN Business","title":"Boeing delivers a 737 Max to one of the airlines that suffered a fatal crash of the plane - CNN","description":"Ethiopian Airlines took delivery of a 737 Max from Boeing in June, the aircraft maker disclosed Tuesday.","url":"https://www.cnn.com/2022/07/12/business/boeing-737-max-ethiopian-airlines/index.html","urlToImage":"https://cdn.cnn.com/cnnnext/dam/assets/220712104823-ethiopia-airlines-boeing-737-max-8-demonstration-addis-ababa-0201-super-tease.jpg","publishedAt":"2022-07-12T22:27:00Z","content":null},{"source":{"id":"financial-times","name":"Financial Times"},"author":"Colby Smith, Kate Duguid","title":"Fake US inflation report circulates a day before data release - Financial Times","description":"Bureau of Labor Statistics discredits false document ahead of hotly-anticipated update on prices","url":"https://www.ft.com/content/7dc56e29-e1a8-4611-b482-2f3c674c1d2e","urlToImage":"https://www.ft.com/__origami/service/image/v2/images/raw/https%3A%2F%2Fd1e00ek4ebabms.cloudfront.net%2Fproduction%2F2d6e6aae-217f-4a28-84ff-e510710325f8.jpg?source=next-opengraph&fit=scale-down&width=900","publishedAt":"2022-07-12T21:50:04Z","content":"The US Bureau of Labor Statistics was forced to publicly discredit a fake inflation data report that circulated on Tuesday, just one day before the scheduled release.\r\nThe document, which sought to m… [+1779 chars]"},{"source":{"id":"usa-today","name":"USA Today"},"author":"Rayna Song, USA TODAY","title":"Free lunch alert: Subway is giving away free 6-inch sandwiches today. Here's how to get one. - USA TODAY","description":"Subway is giving away up to one million free Subway Series sandwiches Tuesday, from 10 a.m. to 12 p.m. local time. Find out how to get one.","url":"https://www.usatoday.com/story/money/food/2022/07/12/subway-free-sandwich-giveaway/10038608002/","urlToImage":"https://www.gannett-cdn.com/presto/2022/07/04/USAT/6eacf271-a583-489d-9e88-89da81101a24-New_Menu_Board.jpg?auto=webp&crop=7184,4041,x0,y101&format=pjpg&width=1200","publishedAt":"2022-07-12T21:50:00Z","content":"Free Subway sandwich? Yes, please.\r\nFor the first time in its nearly 60-year history, Subway is changing its menu substantially by taking away some of the ingredient autonomy its customers have come … [+1257 chars]"},{"source":{"id":"cnn","name":"CNN"},"author":"Danielle Wiener-Bronner, CNN Business","title":"Starbucks to close 16 stores citing personal safety concerns - CNN","description":"Starbucks is planning to close 16 locations across various cities, citing safety concerns.","url":"https://www.cnn.com/2022/07/12/business-food/starbucks-store-closures/index.html","urlToImage":"https://cdn.cnn.com/cnnnext/dam/assets/220712112652-starbucks-coffee-cup-2022-super-tease.jpg","publishedAt":"2022-07-12T21:40:00Z","content":null},{"source":{"id":"engadget","name":"Engadget"},"author":"https://www.engadget.com/about/editors/kris-holt","title":"Rivian CEO tells staff the company is carrying out a 'major' cost-cutting effort | Engadget - Engadget","description":"Layoffs haven't been confirmed, but the company has an all-hands meeting Friday..","url":"https://www.engadget.com/rivian-ceo-memo-cost-cutting-layoffs-205556718.html","urlToImage":"https://s.yimg.com/os/creatr-uploaded-images/2021-12/3a23c360-68be-11ec-bffd-220e73f95ced","publishedAt":"2022-07-12T21:24:47Z","content":"Electric vehicle maker Rivian is planning a \"major\" cost-cutting drive and will be \"as thoughtful as possible as we consider any reductions,\" CEO RJ Scaringe wrote in a memo to employees. Scaringe se… [+4609 chars]"},{"source":{"id":"the-verge","name":"The Verge"},"author":"Umar Shakir","title":"Walmart taps into new neighbor Canoo for electric delivery vehicles - The Verge","description":"Walmart has ordered 4,500 of Canoo’s Lifestyle Delivery Vehicles (LDV) for use with the retailers growing InHome and GoLocal delivery services. The order comes after Canoo moved its HQ near Walmart’s HQ in Bentonville.","url":"https://www.theverge.com/2022/7/12/23205701/canoo-walmart-electric-delivery-vans-deal","urlToImage":"https://cdn.vox-cdn.com/thumbor/1zLsC9nVrZyiog-PIIJO7b-fNys=/0x53:2700x1467/fit-in/1200x630/cdn.vox-cdn.com/uploads/chorus_asset/file/23762452/Walmart_to_Purchase_Canoo.jpg","publishedAt":"2022-07-12T21:24:42Z","content":"A timely deal for the EV manufacturer as its running out of cash\r\nImage: Canoo\r\nWalmart is here to throw a life preserver to ailing EV manufacturer Canoo. Its taking the form of a very helpful order … [+2873 chars]"},{"source":{"id":null,"name":"Gizmodo.com"},"author":"Kyle Barr","title":"It's Officially Too Hot for Crypto Mining in Texas - Gizmodo","description":"Multiple mining operations reported they were voluntarily temporarily reducing operations during spikes in energy demand on a traditionally spotty grid.","url":"https://gizmodo.com/crypto-texas-ercot-bitcoin-heatwave-1849170538","urlToImage":"https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/0db42f34442b55bf45c4eaeea830984c.jpg","publishedAt":"2022-07-12T20:35:00Z","content":"Crypto mining operations in Texas are tugging at their collars, now finding a reason to sweat other than the lingering crypto bear market. Temperatures in Texas are expected to go well over 100 degre… [+4893 chars]"},{"source":{"id":"the-wall-street-journal","name":"The Wall Street Journal"},"author":"Joe Flint","title":"Netflix Seeks to Renegotiate Deals to Show Ads Next to Popular Shows - WSJ - The Wall Street Journal","description":"The streaming giant wants to amend its programming deals with major entertainment studios to allow it to put content on an ad-supported version of the service.","url":"https://www.wsj.com/articles/netflix-in-talks-with-hollywood-studios-to-facilitate-new-ad-supported-platform-11657643431","urlToImage":"https://images.wsj.net/im-581770/social","publishedAt":"2022-07-12T20:31:00Z","content":"Netflix is seeking to amend its programming deals with major entertainment studios to allow the streaming giant to put content on an advertising-supported version of the service, people familiar with… [+258 chars]"},{"source":{"id":null,"name":"Gizmodo.com"},"author":"Gabriella Sotelo","title":"Lego Leaves Russia for Good - Gizmodo","description":"The LEGO Group has previously halted shipments to Russia but has now \"indefinitely ceased commercial operations in Russia.\"","url":"https://gizmodo.com/lego-russia-ukraine-war-1849170314","urlToImage":"https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/3f2445a999b661b8a5e1431e5f3079c3.jpg","publishedAt":"2022-07-12T20:05:00Z","content":"The LEGO Group is the latest to stop sales in Russia. This halt comes after the company paused shipments to Russia in March. The worlds largest toy maker follows a slew of companies like Starbucks, A… [+1933 chars]"}]}
//        """
//
//        let jsonData = Data(jsonString.utf8)
//
////        if let decoded = try JSONDecoder().decode(NewsModel.self, from: jsonData) {
////            return decoded.articles
////        } else {
////            print("hie")
////            return []
////        }
//        do {
//
//            return try JSONDecoder().decode(NewsModel.self, from: jsonData)
//            print("Success")
//        } catch {
//            print(error)
//            print(error.localizedDescription)
//            return nil
//        }
//        return nil
//    }
//
//
//    func hufsi() -> NewsModel? {
//        let str = """
//{
//"status": "ok",
//"totalResults": 69,
//"articles": [
//{
//"source": {
//"id": null,
//"name": "Golem.de"
//},
//"author": null,
//"title": "Beratervertrag endet: Designlegende Jony Ive trennt sich endgültig von Apple - Golem.de - Golem.de",
//"description": null,
//"url": "https://www.golem.de/sonstiges/zustimmung/auswahl.html?from=https:%2F%2Fwww.golem.de%2Fnews%2Fberatervertrag-endet-designlegende-jony-ive-trennt-sich-endgueltig-von-apple-2207-166829.html",
//"urlToImage": null,
//"publishedAt": "2022-07-13T06:48:01Z",
//"content": "Besuchen Sie Golem.de wie gewohnt mit Werbung und Tracking, indem Sie der Nutzung aller Cookies zustimmen.\r\n Details zum Tracking finden Sie im Privacy Center.\r\nSkript wurde nicht geladen. Informatio… [+575 chars]"
//}]}
//"""
//
//        let jsonData = Data(str.utf8)
//        do {
//            return try JSONDecoder().decode(NewsModel.self, from: jsonData)
//        } catch {
//            print(error)
//            print(error.localizedDescription)
//            return nil
//        }
//    }
//}
//
//
