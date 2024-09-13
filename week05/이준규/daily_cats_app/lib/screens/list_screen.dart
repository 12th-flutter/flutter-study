import 'package:flutter/material.dart';

import '../models/cat.dart';
import 'detail_screen.dart';
import 'add_cat_screen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Cat> cats = [
    Cat(
      id: "0",
      name: "Ulsan HD",
      title: "Cinnamoroll",
      link: "assets/images/KLeague_00.jpg",
      likeCount: 1930,
      replyCount: 6,
      created: DateTime(2024, 08, 28, 22, 14, 53, 982),
      replies: ["한교동이 제일 기여워!!", "수원삼성은 승격뿐!"],
    ),
    Cat(
      id: "1",
      name: "Suwon Samsung Bluewings ",
      title: "Hangyodon",
      link: "assets/images/KLeague_01.jpg",
      likeCount: 3023,
      replyCount: 9,
      created: DateTime(2024, 08, 28, 11, 00, 23, 689),
      replies: ["산리오 캐릭터들 다 귀엽다.", "한교동 날 가져!!"],
    ),
    Cat(
      id: "2",
      name: "FC Seoul",
      title: "Hello Kitty",
      link: "assets/images/KLeague_02.jpg",
      likeCount: 1003,
      replyCount: 2,
      created: DateTime(2024, 08, 28, 11, 24, 9, 353),
      replies: ["제일 귀엽네,,"], // replies 필드 추가
    ),
    Cat(
      id: "3",
      name: "Jeonbuk Hyundai Motors",
      title: "Pochacco",
      link: "assets/images/KLeague_03.jpg",
      likeCount: 2012,
      replyCount: 53,
      created: DateTime(2024, 08, 28, 23, 59, 59, 999),
      replies: ["교동이 귀여워"],
    ),
    Cat(
      id: "4",
      name: "Pohang Steelers",
      title: "Kuromi",
      link: "assets/images/KLeague_04.jpg",
      likeCount: 443,
      replyCount: 1,
      created: DateTime(2024, 08, 28, 17, 32, 50, 725),
      replies: [],
    ),
    Cat(
      id: "5",
      name: "GwangJu",
      title: "Pompompurin",
      link: "assets/images/KLeague_06.jpg",
      likeCount: 422,
      replyCount: 3,
      created: DateTime(2024, 08, 28, 17, 32, 50, 725),
      replies: [],
    ),
  ];

  void _addNewCat() async {
    final result = await Navigator.push<Cat>(
      context,
      MaterialPageRoute(builder: (context) => AddCatScreen()),
    );
    if (result != null) {
      setState(() {
        cats.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("KLegue Sanrio"),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: _addNewCat,
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
