drv <- JDBC("oracle.jdbc.OracleDriver", classPath = "Y:/path/ojdbc6.jar", " ")
con <- dbConnect(drv, "jdbc:oracle:thin:@add.ress.to.db:port:sid", "userName", "passWord")
qry <- "SELECT * FROM Table"
rst <- dbGetQuery(con, qry)
