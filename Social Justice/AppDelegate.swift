//
//  AppDelegate.swift
//  Social Justice
//
//  Created by Gabriel Spound on 1/8/17.
//  Copyright © 2017 Gabriel Spound. All rights reserved.
//

import UIKit

func saveuser() {
    let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(globUs, toFile: User.archiveURL.path)
    if isSuccessfulSave {
        print("user saved")
    } else {
        print("failed save")
    }
}

struct TagsStruct {
    let animals = Tag(s: "Animal Rights")
    let prochoice = Tag(s: "Pro-Choice")
    let prolife = Tag(s: "Pro-Life")
    let guncontrol = Tag(s: "Gun Control")
    let gunrights = Tag(s: "Gun Rights")
    let civilrights = Tag(s: "Civil Rights")
    let LGBTQ = Tag(s: "LGBTQIA+ Rights")
    let jew = Tag(s: "Jewish")
    let safe = Tag(s: "Public Safety")
    let refugee = Tag(s: "Refugees")
    let environment = Tag(s: "Environment")
    let children = Tag(s: "Children")
    let med = Tag(s: "Medicine")
    let pov = Tag(s: "Poverty")
}

let globTS = TagsStruct.init()

let globTA = [globTS.animals, globTS.civilrights, globTS.guncontrol, globTS.gunrights, globTS.LGBTQ, globTS.prochoice, globTS.prolife, globTS.jew, globTS.safe, globTS.refugee, globTS.environment, globTS.children, globTS.med, globTS.pov]

struct OrgsStruct {
    let aspca = Organization(t: "American Society for the Prevention of Cruelty to Animals", a: "ASPCA", tA: [0], sD: "Works to rescue animals from abuse", u: "http://www.aspca.org/sites/default/files/aspca-logo-square.png", o: "https://www.aspca.org/")
    let plannedP = Organization(t: "Planned Parenthood", a: "Planned Parenthood", tA: [5], sD: "Provides reproductive health services globally", u: "http://www.therightfew.com/wp-content/uploads/2016/09/Planned-Parenthood-Logo-Square.jpg", o: "https://www.plannedparenthood.org/")
    let nRA = Organization(t: "National Rifle Association", a: "NRA", tA: [3], sD: "Advocates for gun rights in the US", u: "http://www.2acheck.com/wp-content/uploads/2013/02/NRA-logo.jpg", o: "https://home.nra.org/")
    let jewGuns = Organization(t: "Jews for the Preservation of Firearms Ownership", a: "JPFO", tA: [3], sD: "Jewish Group dedicated to the preservation of gun rights in the US", u: "http://www.ammoland.com/wp-content/uploads/2011/07/Jews-For-The-Preservation-Of-Firearms-Ownership-Logo.jpg?63352d", o: "http://jpfo.org/")
    let brady = Organization(t: "Brady Campaign to Prevent Gun Violence", a: "Brady", tA: [2], sD: "Dedicated to creating a safe America by fighting for gun control legislation", u: "http://concertacrossamerica.org/wp-content/uploads/2016/07/Brady_Square.png", o: "http://www.bradycampaign.org/")
    let ilga = Organization(t: "International Lesbian, Gay, Bisexual, Trans and Intersex Association", a: "ILGA", tA: [4], sD: "Active group in campaigning for LGBT rights and intersex human rights", u: "http://ilga.org/wp-content/uploads/2013/05/network-logo-america.png", o: "http://ilga.org/")
    let aclu = Organization(t: "American Civil Liberties Union", a: "ACLU", tA: [1, 4], sD: "Defends and preserves the individual rights and liberties guaranteed to every person in the US", u: "http://liveactionnews.org/wp-content/uploads/2015/07/ACLU-Square-Logo.jpg", o: "https://www.aclu.org/")
    let SPLC = Organization(t: "Southern Poverty Law Center", a: "SPLC", tA: [1, 13, 8], sD: "Legal advocacy organization specializing in civil rights and public interest litigation", u: "https://media.glassdoor.com/sqll/16443/southern-poverty-law-center-squarelogo-1425449106287.png", o: "https://www.splcenter.org/")
    let antiantijew = Organization(t: "Anti Defamation League", a: "ADL", tA: [7], sD: "Jewish non-governmental organization focused on secure justice and fair treatment of all people", u: "https://lh5.googleusercontent.com/-zaMmqs6puqM/AAAAAAAAAAI/AAAAAAAAEo4/rIroca48MhQ/s0-c-k-no-ns/photo.jpg", o: "http://www.adl.org/")
    let glaad = Organization(t: "Gay & Lesbian Alliance Against Defamation", a: "GLAAD",tA: [4, 1], sD: "US non-governmental media monitoring organization founded by LGBT people in the media", u: "http://www.glaad.org/sites/default/files/styles/480x480/public/glaad-logo-square.jpg?itok=Dufw62F-", o: "http://www.glaad.org/")
    let responsible = Organization(t: "Americans For Responsible Solutions", a: "MADD", tA: [2], sD: "US non-profit organization and super PAC that supports gun control", u: "http://action.americansforresponsiblesolutions.org/page/-/images/logo-bars.jpg", o: "http://americansforresponsiblesolutions.org/?nosplash=true")
    let madd = Organization(t: "Mother's Against Drunk Driving", a: "MADD", tA: [8], sD: "non-profit organization that seeks to stop drunk driving", u: "http://www.talklikemadd.org/timeline//images/madd2001logo-500x500.png", o: "http://www.madd.org/")
    let sandy = Organization(t: "Sandy Hook Promise", a: "SHP", tA: [2, 11], sD: "non-profit organization that provides programs and practices that protect children and prevent gun violence" ,u: "https://pbs.twimg.com/profile_images/808851237852639232/ukkCGgjV.jpg", o: "http://www.sandyhookpromise.org/")
//    let rescue = Organization(t: "International Rescue Committee", a: "IRC",tA:,sD:,u:,o:)
//    let peta = Organization(t: "People for the Ethical Treatment of Animals", a: "PETA",tA:,sD:,u:,o:)
//    let ocean = Organization(t: "Clean Oceans International", a: "COI",tA:,sD:,u:,o:)
//    let deforest = Organization(t: "Avoided Deforestation Partners", a: "ADP",tA:,sD:,u:,o:)
//    let climate = Organization(t: "Climate Reality Project", a: "CRP",tA:,sD:,u:,o:)
//    let clinton = Organization(t: "Clinton Global Initiative", a: "CGI",tA:,sD:,u:,o:)
//    let children = Organization(t: "Free The Children", a: "WE",tA:,sD:,u:,o:)
//    let wildlife = Organization(t: "National Wildlife Federation", a: "NWF",tA:,sD:,u:,o:)
//    let africaDoc = Organization(t: "US Doctors for Africa", a: "USDFA",tA:,sD:,u:,o:)
//    let unep = Organization(t: "United Nations Environment Program",a: "UNEP",tA:,sD:,u:,o:)
//    let docBorders = Organization(t: "Doctors without Borders", a: "DWB",tA:,sD:,u:,o:)
}

let globOS = OrgsStruct.init()

let globOA = [globOS.aspca, globOS.plannedP, globOS.nRA, globOS.jewGuns, globOS.brady, globOS.ilga, globOS.aclu, globOS.SPLC, globOS.antiantijew, globOS.glaad, globOS.responsible, globOS.madd, globOS.sandy]

var globUs = User.init()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if let us = NSKeyedUnarchiver.unarchiveObject(withFile: User.archiveURL.path) as? User {
            globUs = us
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "main")
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        saveuser()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        saveuser()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        if let us = NSKeyedUnarchiver.unarchiveObject(withFile: User.archiveURL.path) as? User {
            globUs = us
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "main")
            self.window = UIWindow(frame: UIScreen.main.bounds)
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
        }
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        saveuser()
    }


}

extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }
}

