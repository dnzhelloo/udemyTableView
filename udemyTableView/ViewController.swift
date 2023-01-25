import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet var countriesTableView : UITableView!
    let countryApi = "http://country.io/names.json"
    let currenyApi = "http://country.io/currency.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func getCountryList(_ url:String,returnString: @escaping (NSDictionary)->()){
        let doNetwork = AF.request(url).validate().responseJSON{ response in
            switch response.result {
            case .success(let site):
//                let object = try? JSONSerialization.jsonObject(
//                    with: response.data!,
//                    options: []
//                )
                guard let dict = site as? NSDictionary else { return }
                returnString(dict)
                
            case .failure(let err):
                           print(err.localizedDescription)
                       }                //
            }
        }
    }
