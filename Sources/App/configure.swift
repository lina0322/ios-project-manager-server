import Fluent
import FluentPostgresDriver
import Vapor

public func configure(_ app: Application) throws {
    
    if let databaseURL = Environment.get("DATABASE_URL"),
       var postgresConfig = PostgresConfiguration(url: databaseURL) {
        postgresConfig.tlsConfiguration = .forClient(certificateVerification: .none)
        app.databases.use(.postgres(configuration: postgresConfig
        ), as: .psql)
    } else {
        app.databases.use(.postgres(
            hostname: Environment.get("DATABASE_HOST") ?? "localhost",
            port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
            username: Environment.get("DATABASE_USERNAME") ?? "innie",
            password: Environment.get("DATABASE_PASSWORD") ?? "inniepassword",
            database: Environment.get("DATABASE_NAME") ?? "items"
        ), as: .psql)
    }
    
    app.migrations.add(CreateItem())
    try app.autoMigrate().wait()
    try routes(app)
}
