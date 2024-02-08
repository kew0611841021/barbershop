import 'package:flutter/material.dart';

class BarberList extends StatefulWidget {
  const BarberList({super.key});

  @override
  State<BarberList> createState() => _BarberListState();
}

class _BarberListState extends State<BarberList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ช่างตัดผม"),
      ),
    );
  }
}

class BarberListList extends ChangeNotifier {
  List<BarberList> BarberLists = [
    BarberList(
      name: 'Tickeled Pink',
      description:
          'North Indian, Italian, Mexican, Biryani, Desserts, Mediterranean, Continental, European',
      imageURL:
          'https://images.unsplash.com/photo-1552566626-52f8b828add9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cmVzdGF1cmFudHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
    ),
    BarberList(
      name: 'Cafe Delhi Heights',
      description:
          'North Indian, Asian, Italian, Desserts, Beverages, Biryani, Salad',
      imageURL:
          'https://b.zmtcdn.com/data/pictures/6/4766/eb78a10db1ea400e2f31d80f39c4bef6.jpg',
    ),
    BarberList(
      name: ' The Sky High',
      description:
          'French, Chinese, Italian, Greece, COntinental, North-Indian, Desserts, Sides, Mexican, Thai',
      imageURL:
          'https://images.unsplash.com/photo-1544148103-0773bf10d330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHJlc3RhdXJhbnRzfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    ),
    BarberList(
      name: ' Social',
      description:
          'American, Mexican, Indian, Thai, Turkey, Continental, Speciality in Desi dhaba',
      imageURL:
          'https://media.istockphoto.com/id/1356890630/photo/interior-of-modern-loft-style-BarberList-with-fresh-flowers-and-mirror.jpg?b=1&s=170667a&w=0&k=20&c=A1K7hQu7t39DaPXQWa068wmk6CX5-kVXdpM3btblI4o=',
    ),
  ];

  void addBarberList(BarberList BarberList) {
    BarberLists.add(BarberList);
    notifyListeners();
  }

  void updateBarberList(int index, BarberList BarberList) {
    BarberLists[index] = BarberList;
    notifyListeners();
  }

  void deleteBarberList(int index) {
    BarberLists.removeAt(index);
    notifyListeners();
  }
}

class BarberListListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(244, 194, 194, 1.000),
        appBar: AppBar(
          title: Text(
            'BarberList List',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color.fromRGBO(194, 244, 244, 1.000),
        ),
        body: Consumer<BarberListList>(
          //SizedBox(height: 10,),
          builder: (context, BarberListList, child) {
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 30,
              ),
              itemCount: BarberListList.BarberLists.length,
              itemBuilder: (context, index) {
                final BarberList = BarberListList.BarberLists[index];
                return ListTile(
                  leading: Image.network(BarberList.imageURL),
                  title: Text(BarberList.name),
                  subtitle: Text(BarberList.description),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      BarberListList.deleteBarberList(index);
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BarberListDetailsScreen(index: index),
                      ),
                    );
                  },
                );
              },
            );
          }, //builder
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          //child: Text('add item'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddBarberListScreen(),
              ),
            );
          },
        ));
  }
}
// class BarberListDetailScreen extends StatelessWidget{
//   final int index=0;

class BarberListDetailsScreen extends StatelessWidget {
  final int index;

  BarberListDetailsScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    final BarberListList = Provider.of<BarberListList>(context);
    final BarberList = BarberListList.BarberLists[index];

    return Scaffold(
      appBar: AppBar(
        title: Text('BarberList Details'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(BarberList.imageURL),
          SizedBox(height: 20),
          Text(
            BarberList.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            BarberList.description,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditBarberListScreen(index: index),
            ),
          );
        },
      ),
    );
  }
}

class AddBarberListScreen extends StatefulWidget {
  @override
  _AddBarberListScreenState createState() => _AddBarberListScreenState();
}

class _AddBarberListScreenState extends State<AddBarberListScreen> {
  late String name;
  late String description;
  late String imageURL;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add BarberList'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Image URL',
              ),
              onChanged: (value) {
                setState(() {
                  imageURL = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Add'),
              onPressed: () {
                final BarberList = BarberList(
                  name: name,
                  description: description,
                  imageURL: imageURL,
                );
                final BarberListList =
                    Provider.of<BarberListList>(context, listen: false);
                BarberListList.addBarberList(BarberList);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class EditBarberListScreen extends StatefulWidget {
  final int index;

  EditBarberListScreen({required this.index});

  @override
  _EditBarberListScreenState createState() => _EditBarberListScreenState();
}

class _EditBarberListScreenState extends State<EditBarberListScreen> {
  late String name;
  late String description;
  late String imageURL;

  @override
  Widget build(BuildContext context) {
    final BarberListList = Provider.of<BarberListList>(context);
    final BarberList = BarberListList.BarberLists[widget.index];
    name = BarberList.name;
    description = BarberList.description;
    imageURL = BarberList.imageURL;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit BarberList'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
              controller: TextEditingController(text: name),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
              controller: TextEditingController(text: description),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Image URL',
              ),
              onChanged: (value) {
                setState(() {
                  imageURL = value;
                });
              },
              controller: TextEditingController(text: imageURL),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Save'),
              onPressed: () {
                final updatedBarberList = BarberList(
                  name: name,
                  description: description,
                  imageURL: imageURL,
                );
                BarberListList.updateBarberList(
                    widget.index, updatedBarberList);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
