import Foundation

let reminederURL = URL(fileURLWithPath: "Reminders", relativeTo: FileManager.documentDirectoryURL)

let stringURL = FileManager.documentDirectoryURL.appendingPathComponent("String").appendingPathComponent("txt")

stringURL.path


let challengeString: String = "Todo List"
let challengeURL: URL = URL(fileURLWithPath: challengeString,
                            relativeTo: FileManager.documentDirectoryURL)
                            .appendingPathComponent("txt")

challengeURL.lastPathComponent
