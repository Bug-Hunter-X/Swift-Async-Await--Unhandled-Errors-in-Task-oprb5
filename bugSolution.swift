func fetchData() async throws -> Data {
    let url = URL(string: "https://api.example.com/data")!
    let (data, response) = try await URLSession.shared.data(from: url)

    guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
        throw URLError(.badServerResponse)
    }

    return data
}

Task { 
    do {
        let data = try await fetchData()
        // Process data
    } catch {
        print("Error fetching data: \(error)")
    }
}.onCompletion { result in 
    switch result {
    case .failure(let error):
        print("Task failed with error: \(error)")
    case .success: break
    }
} 
//The .onCompletion block handles any errors that might have occurred before the await keyword.