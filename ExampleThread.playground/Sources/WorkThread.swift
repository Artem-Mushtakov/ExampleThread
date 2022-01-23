import Foundation

///Класс припайки чипов

public class WorkThread: Thread {
    
    private var storage: Storage
    
    public init(storage: Storage) {
        self.storage = storage
    }
    
    public override func main() {
        while true {
            while storage.isEmpty == false {
                storage.condition.lock()
                let storageChip = storage.pop()
                storageChip.sodering()
                print("Припаяли чип \(storageChip)")
                storage.condition.signal()
                storage.condition.unlock()
            }
        }
    }
}
