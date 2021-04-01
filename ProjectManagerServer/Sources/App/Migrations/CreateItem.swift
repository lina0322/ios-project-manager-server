import Fluent

struct CreateItem: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("items")
            .id()
            .field("title", .string)
            .field("body", .string)
            .field("state", .string)
            .field("deadline", .double)
            .field("last_modified", .double)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("items").delete()
    }
}
