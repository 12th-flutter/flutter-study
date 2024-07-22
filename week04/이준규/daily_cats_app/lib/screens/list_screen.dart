import 'package:flutter/material.dart';

import '../models/cat.dart';
import 'detail_screen.dart';

final List<Cat> cats = [
  Cat(
    id: "0",
    name: "Ulsan HD",
    title: "Cinnamoroll",
    link: "assets/images/KLeague_00.jpg",
    likeCount: 1930,
    replyCount: 6,
    created: DateTime(2022, 11, 13, 22, 14, 53, 982),
  ),
  Cat(
    id: "1",
    name: "Suwon Samsung Bluewings ",
    title: "Hangyodon",
    link: "assets/images/KLeague_01.jpg",
    likeCount: 3023,
    replyCount: 9,
    created: DateTime(2022, 10, 24, 11, 00, 23, 689),
  ),
  Cat(
    id: "2",
    name: "FC Seoul",
    title: "Hello Kitty",
    link: "assets/images/KLeague_02.jpg",
    likeCount: 1003,
    replyCount: 2,
    created: DateTime(2022, 1, 6, 11, 24, 9, 353),
  ),
  Cat(
    id: "3",
    name: "Jeonbuk Hyundai Motors",
    title: "Pochacco",
    link: "assets/images/KLeague_03.jpg",
    likeCount: 2012,
    replyCount: 53,
    created: DateTime(2021, 12, 31, 23, 59, 59, 999),
  ),
  Cat(
    id: "4",
    name: "Pohang Steelers",
    title: "Kuromi",
    link: "assets/images/KLeague_04.jpg",
    likeCount: 443,
    replyCount: 1,
    created: DateTime(2022, 4, 23, 17, 32, 50, 725),
  ),
];

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KLegue Sanrio"),
        actions: [
          // 업로드 화면으로 이동
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {},
          )
        ],
      ),
      body: GridView.builder(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 10.0,
            right: 10.0,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          itemCount: cats.length,
          itemBuilder: (_, int index) => GestureDetector(
                // 상세화면으로 이동
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        cat: cats[index],
                      ),
                    ),
                  );
                },
                child: Image.asset(
                  cats[index].link,
                  fit: BoxFit.cover,
                ),
              )),
    );
  }
}
