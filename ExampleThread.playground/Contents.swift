import Foundation

let storage = Storage()

let generateThread = GenerateThread(storage: storage)
let workThread = WorkThread(storage: storage)

generateThread.start()
workThread.start()

sleep(20)

generateThread.cancel()
workThread.cancel()



