import Foundation

///Класс припайки чипов

public class WorkThread: Thread {
    
    private var storage: Storage
    
    public init(storage: Storage) {
        self.storage = storage
    }
    
    public override func main() {

        repeat {
            let storageChip = storage.pop()
            storageChip.sodering()
            print("Припаяли чип \(storageChip)")
        } while storage.isAvailable || storage.isEmpty
    }
}
