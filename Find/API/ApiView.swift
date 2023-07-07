import Foundation

struct ArtistData: Codable {
    let artists: Artists?
}

struct Artists: Codable {
    let href: String?
    let items: [Artist]?
    let limit: Int?
    let next: String?
    let offset: Int?
    let previous: String?
    let total: Int?
}

struct Artist: Codable {
    let followers: Followers?
    let genres: [String]?
    let href: String?
    let id: String?
    let images: [Image]?
    let name: String?
    let popularity: Int?
    let type: String?
    let uri: String?
}

struct Followers: Codable {
    let href: String?
    let total: Int?
}

struct Image: Codable {
    let height: Int?
    let url: String?
    let width: Int?
}

class API: ObservableObject  {
    
    @Published var users: [Artist] = []
    
    // Defina suas credenciais da API do Spotify
    private let clientID = APIKeys.clientID
    private let clientSecret = APIKeys.clientSecret
    
   

    private let baseURL = "https://accounts.spotify.com"
    private let baseURLBuscar = "https://api.spotify.com"
    private var tokenType = ""
    private var token = ""
    private var expiresIn = 0
    
    private var nomes = ["João", "Pedro", "Lucas", "Miguel", "Arthur", "Davi", "Gabriel", "Maria", "Ana", "Luisa", "Mariana", "Isabella", "Sophia", "Laura", "Enzo", "Matheus", "Giovanna", "Valentina", "Rafael", "Eduarda"]
    
    // Faça uma solicitação para obter um token de acesso
    private func getToken() {
        let path = "/api/token"
        
        guard let url = URL(string: self.baseURL+path) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let parameters: [String: String] = [
            "grant_type": "client_credentials",
            "client_id": self.clientID,
            "client_secret": self.clientSecret
        ]
 
        
        request.httpBody = parameters
            .map { "\($0)=\($1)" }
            .joined(separator: "&")
            .data(using: .utf8)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                if let data = data {
                    DispatchQueue.main.async {
                        do {
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                if let accessToken = json["access_token"] as? String,
                                   let tokenType = json["token_type"] as? String,
                                   let expiresIn = json["expires_in"] as? Int {
                                    
                                    self.tokenType = tokenType
                                    self.token = accessToken
                                    self.expiresIn = expiresIn
                                    print("Token: " +  self.token)
                                    
                                    // Faça o que desejar com as variáveis aqui
                                } else {
                                    print("Não foi possível obter os valores do JSON.")
                                }
                            } else {
                                print("Não foi possível converter o JSON retornado.")
                            }
                        } catch {
                            print("Ocorreu um erro ao processar o JSON: \(error.localizedDescription)")
                        }
                    }
                }
            }
        }.resume()
    }
    
    //Buscar artista
    func buscar() async throws {
        
          getToken()
        
        let path = "/v1/search?q=\(gerarNomeBrasileiro())&type=artist&market=BR&limit=1"
        let urlString = self.baseURLBuscar + path
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(self.token)", forHTTPHeaderField: "Authorization")
       
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        
        guard let httpResponse = response as? HTTPURLResponse else {
               fatalError("Invalid HTTP response")
           }
        print(httpResponse.statusCode)
//        guard  httpResponse.statusCode == 200 else {
//               fatalError("Invalid HTTP response")
//           }
      
        
        
        if let jsonString = String(data: data, encoding: .utf8) {
            print("Dados recebidos:\n\(jsonString)")
        }
        
        do {
            let decoder = JSONDecoder()
            let responseData = try decoder.decode(ArtistData.self, from: data)
            
            if let artistData = responseData.artists?.items {
                DispatchQueue.main.async {
                    self.users = artistData
                }
            } else {
                print("Artista não encontrado")
            }
        } catch {
            print("Erro na decodificação do JSON: \(type(of: error)), \(error.localizedDescription)")
        }
    }
    
    func gerarNomeBrasileiro() -> String {
        guard !nomes.isEmpty else {
            return "Não há mais nomes disponíveis"
        }
        
        let randomIndex = Int.random(in: 0..<nomes.count)
        let randomNome = nomes[randomIndex]
        
        nomes.remove(at: randomIndex)
        
        return randomNome
    }
}
