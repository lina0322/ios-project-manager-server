import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(hostname: "localhost", username: "사용자명", password: "비밀번호", database: "projectmanagerdb"), as: .psql)
    
    app.migrations.add(CreateItem())
    
    // register routes
    try routes(app)
}
