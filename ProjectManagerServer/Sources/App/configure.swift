import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(.postgres(hostname: "localhost", username: "innie", password: "inniepassword", database: "projectmanagerdb"), as: .psql)
    
    app.migrations.add(CreateItem())
    
    // register routes
    try routes(app)
}
