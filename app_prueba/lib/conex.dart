import 'package:mysql_client/mysql_client.dart';

Future<void> main(List<String> arguments) async {
  print("Connecting to mysql server...");

  // create connection
  final conn = await MySQLConnection.createConnection(
    host: "127.0.0.1",
    port: 3306,
    userName: "your_user",
    password: "your_password",
    databaseName: "your_database_name", // optional
  );

  await conn.connect(); 
}