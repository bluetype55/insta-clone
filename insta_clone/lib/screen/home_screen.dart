import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          StoryArea(),
          FeedList(),
        ],
      ),
    );
  }
}

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          height: 0,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                  width: 1,
                  color: Colors.grey.withOpacity(0.5),
                  style: BorderStyle.solid),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: List.generate(
                  50, (index) => UserStory(userName: 'User$index'))),
        ),
        Container(
          width: double.maxFinite,
          height: 8,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                  width: 1,
                  color: Colors.grey.withOpacity(0.5),
                  style: BorderStyle.solid),
            ),
          ),
        ),
      ],
    );
  }
}

class UserStory extends StatelessWidget {
  final String userName;
  const UserStory({
    required this.userName,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
                color: Colors.blue[300],
                borderRadius: BorderRadius.circular(40)),
          ),
          Text(userName),
        ],
      ),
    );
  }
}

class FeedData {
  final String userName;
  final int likeCount;
  final String content;

  FeedData(
      {required this.userName, required this.likeCount, required this.content});
}

final feedDataList = [
  FeedData(
      userName: 'User1',
      likeCount: 5,
      content:
          '오늘 점심은 맛있었다오늘 점심은 맛있었다오늘 점심은 맛있었다오늘 점심은 맛있었다오늘 점심은 맛있었다오늘 점심은 맛있었다오늘 점심은 맛있었다오늘 점심은 맛있었다오늘 점심은 맛있었다오늘 점심은 맛있었다오늘 점심은 맛있었다오늘 점심은 맛있었다오늘 점심은 맛있었다오늘 점심은 맛있었다오늘 점심은 맛있었다오늘 점심은 맛있었다'),
  FeedData(userName: 'User2', likeCount: 10, content: '오늘 아침은 맛있었다'),
  FeedData(userName: 'User3', likeCount: 52, content: '오늘 저녁은 맛있었다'),
  FeedData(userName: 'User4', likeCount: 33, content: '내일 점심은 맛있었다'),
  FeedData(userName: 'User5', likeCount: 25, content: '내일 아침은 맛있었다'),
  FeedData(userName: 'User6', likeCount: 8, content: '내일 저녁은 맛있었다'),
  FeedData(userName: 'User7', likeCount: 3, content: '모레 점심은 맛있었다'),
  FeedData(userName: 'User8', likeCount: 0, content: '모레 아침은 맛있었다'),
  FeedData(userName: 'User9', likeCount: 98, content: '모레 저녁은 맛있었다'),
  FeedData(userName: 'User10', likeCount: 50, content: '글피 점심은 맛있었다'),
];

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feedDataList.length,
      itemBuilder: (context, index) => FeedItem(feedData: feedDataList[index]),
    );
  }
}

class FeedItem extends StatelessWidget {
  const FeedItem({required this.feedData, super.key});
  final FeedData feedData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[300],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(feedData.userName),
                ],
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          width: double.infinity,
          height: 300,
          color: Colors.indigo[300],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_outline),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.chat_bubble),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.paperplane),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.bookmark),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '좋아요 ${feedData.likeCount}개',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${feedData.userName} ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: feedData.content),
              ],
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        )
      ],
    );
  }
}
