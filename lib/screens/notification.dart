import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Map<String, dynamic>> notificationList = [
    {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false},
    {
      "userId": 1,
      "id": 2,
      "title": "quis ut nam facilis et officia qui",
      "completed": false
    },
    {"userId": 1, "id": 3, "title": "fugiat veniam minus", "completed": false},
    {"userId": 1, "id": 4, "title": "et porro tempora", "completed": true},
    {
      "userId": 1,
      "id": 5,
      "title":
          "laboriosam mollitia et enim quasi adipisci quia provident illum",
      "completed": false
    },
    {
      "userId": 1,
      "id": 6,
      "title": "qui ullam ratione quibusdam voluptatem quia omnis",
      "completed": false
    },
    {
      "userId": 1,
      "id": 7,
      "title": "illo expedita consequatur quia in",
      "completed": false
    },
    {
      "userId": 1,
      "id": 8,
      "title": "quo adipisci enim quam ut ab",
      "completed": true
    },
    {
      "userId": 1,
      "id": 9,
      "title": "molestiae perspiciatis ipsa",
      "completed": false
    },
    {
      "userId": 1,
      "id": 10,
      "title": "illo est ratione doloremque quia maiores aut",
      "completed": true
    },
    {
      "userId": 1,
      "id": 11,
      "title": "vero rerum temporibus dolor",
      "completed": true
    },
    {
      "userId": 1,
      "id": 12,
      "title": "ipsa repellendus fugit nisi",
      "completed": true
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Notifications"),
      ),
      // body: buildListView(),
      body: Column(
        children: [
          Flexible(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    print(notificationList[index]["title"]);
                  },
                  child: Card(
                    color: Colors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(notificationList[index]["completed"].toString()),
                        SizedBox(height: 4),
                        Text(notificationList[index]["title"]),
                        SizedBox(height: 4),
                        Text(notificationList[index]["id"].toString()),
                        SizedBox(height: 4),
                        Text(notificationList[index]["userId"].toString()),
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }

  Column buildListView() {
    return Column(
      children: [
        Flexible(
          child: ListView.builder(
            itemCount: notificationList.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(notificationList[index]["completed"].toString()),
                    SizedBox(height: 4),
                    Text(notificationList[index]["title"]),
                    SizedBox(height: 4),
                    Text(notificationList[index]["id"].toString()),
                    SizedBox(height: 4),
                    Text(notificationList[index]["userId"].toString()),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
