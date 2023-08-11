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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children:
              List.generate(50, (index) => UserStory(userName: 'User$index'))),
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
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
  FeedData(userName: 'User1', likeCount: 5, content: '오늘 점심은 맛있었다'),
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
    return const Placeholder();
  }
}
