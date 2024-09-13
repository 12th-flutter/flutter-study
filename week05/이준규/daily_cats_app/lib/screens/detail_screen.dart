import 'package:flutter/material.dart';

import '../models/cat.dart';

final List<String> replies = [
  "수원삼성은 승격뿐!",
  "산리오 캐릭터들 다 귀엽다.",
  "제일 귀엽네,,",
];

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.cat,
  });

  final Cat cat;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final TextEditingController _commentController = TextEditingController();
  List<String> comments = [];
  int likeCount = 0;

  @override
  void initState() {
    super.initState();
    comments = List.from(widget.cat.replies);
    likeCount = widget.cat.likeCount;
  }

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        comments.add(_commentController.text);
        _commentController.clear();
      });
    }
  }

  void _incrementLike() {
    setState(() {
      likeCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cat.title),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 10.0,
                right: 10.0,
                bottom: 70.0, // 댓글 입력창을 가리지 않도록 패딩 추가
              ),
              physics: const ClampingScrollPhysics(),
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    widget.cat.link,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.cat.name,
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: Color(
                            0xFF777777,
                          )),
                    ),
                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.thumb_up_outlined,
                          ),
                          onPressed: _incrementLike,
                        ),
                        Text(
                          likeCount.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "댓글 ${comments.length}개",
                ),
                ...List.generate(
                  comments.length,
                  (int index) => Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "익명",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.0),
                        ),
                        Text(
                          comments[index],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: Text(
                    "${widget.cat.created.year}년 ${widget.cat.created.month}월 ${widget.cat.created.day}일",
                    style: const TextStyle(
                      color: Color(0xFFAAAAAA),
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                child: Container(
                  color: Theme.of(context).canvasColor,
                  child: TextField(
                    controller: _commentController,
                    autocorrect: false,
                    onSubmitted: (_) => _addComment(),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                        top: 5.0,
                        bottom: 5.0,
                        left: 10.0,
                      ),
                      border: const OutlineInputBorder(),
                      hintText: "댓글 작성",
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.send,
                          color: Colors.blue,
                        ),
                        onPressed: _addComment,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }
}
