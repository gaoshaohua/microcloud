package com.micro.cloud;
// package com.micro.cloud;
//
// import java.net.UnknownHostException;
//
// import com.mongodb.DB;
// import com.mongodb.DBCollection;
// import com.mongodb.DBCursor;
// import com.mongodb.DBObject;
// import com.mongodb.MongoClient;
//
// public class MongodbKit {
//
// private static final String HOST = "192.168.0.101";
// private static final int PORT = 27017;
//
// public static void main(String[] args) {
// DBCollection col = getCollection("logs");
// DBCursor cursor = col.find();
// while (cursor.hasNext()) {
// DBObject object = cursor.next();
//
// Double index = (Double) object.get("index");
// System.out.println(object.toString());
// }
// }
//
// public static DB getDatabase() {
// try {
// MongoClient mongoClient = new MongoClient(HOST, PORT);
// return mongoClient.getDB("saasoc");
// } catch (UnknownHostException e) {
// e.printStackTrace();
// }
// return null;
// }
//
// public static DBCollection getCollection(String name) {
// DBCollection collection = getDatabase().getCollection(name);
// return collection;
// }
// }
