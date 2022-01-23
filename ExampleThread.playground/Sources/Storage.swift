import Foundation

public class Storage {
    
    private var count = 0
    var condition = NSCondition()
    var storage: [Chip] = []
    
    public var isEmpty: Bool {
        storage.isEmpty
    }
    
    public init() {}
    
    func push() {
        storage.append(Chip.make())
        count += 1
        print("Экземпляр чипа № \(count) добавлен в хранилище.")
    }
    
    func pop() -> Chip {
        return storage.removeLast()
    }
}
