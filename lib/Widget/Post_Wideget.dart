import 'package:flutter/material.dart';
import 'package:instgramui/Models/Post_models.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HeadPost(post: post),
            ),
            post.imageUrl != null
                ? SizedBox.shrink()
                : const SizedBox(
                    height: 6,
                  ),
            post.imageUrl != null
                ? Image.network(post.imageUrl!)
                : const SizedBox.shrink(),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                _PostButton(
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  onTap: () => print('Like'),
                ),
                _PostButton(
                  icon: const Icon(
                    Icons.comment,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  onTap: () => print('Comment'),
                ),
                _PostButton(
                  icon: const Icon(
                    Icons.undo_sharp,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  onTap: () => print('Share'),
                ),
                const SizedBox(
                  width: 230,
                ),
                _PostButton(
                  icon: const Icon(
                    Icons.bookmark_add_outlined,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  onTap: () => print('Share'),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${post.likes} likes",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        "${post.user.name}",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        post.caption,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Text(
                    "View all ${post.comments} comments",
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HeadPost extends StatelessWidget {
  const HeadPost({
    super.key,
    required this.post,
  });
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(post.user.imageUrl),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(color: Colors.white),
              ),
              Row(
                children: [
                  Text(
                    post.timeAgo,
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.public,
                      color: Colors.white,
                      size: 12,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;

  final onTap;

  const _PostButton({
    Key? key,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          height: 25.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
            ],
          ),
        ),
      ),
    );
  }
}
