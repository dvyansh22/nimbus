import 'package:flutter/material.dart';

import '../widgets/profile_post_widget.dart';
import '../widgets/sports_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<String> postImages = [
    'https://static.toiimg.com/thumb/msid-111446219,width-1280,height-720,imgsize-48358,resizemode-6,overlay-toi_sw,pt-32,y_pad-40/photo.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuMshI5ev0nPAsxNSzg7fNqylbDYTKw7tCXA&s',
    'https://news19raj.com/images/news/e80b7340.jpg',
    'https://c.ndtvimg.com/2024-11/g5900f6_rishabh-pant-bcci_625x300_26_November_24.jpg?im=FeatureCrop,algorithm=dnn,width=806,height=605',
    'https://feeds.abplive.com/onecms/images/uploaded-images/2021/03/24/95caba1a615246470da5ad3eec142631_original.jpg',
    'https://pbs.twimg.com/media/FQTyA9EaUAoS7za.jpg',
    'https://assets.gqindia.com/photos/66630689064acdfdb8290f76/16:9/w_2560%2Cc_limit/GQ_Rishabh-Pant_web_top-image%2520(1).jpg',
    'https://i.pinimg.com/originals/5a/74/a8/5a74a8545dd466f35b8b2b6033da7fa9.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT925QX5KbupjOMQQKnH-zVYIEsupzQtUSQ7g&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDlyc0psQcfv2I3EdTOaJNjcx6PDqtPgyhtA&s',
    'https://static.toiimg.com/thumb/imgsize-23456,msid-71011108,width-600,resizemode-4/71011108.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZz34amvrUyWdcgwk8ErFrXLFX8DYxU9bxXA&s',
    'https://c.ndtvimg.com/2024-10/orvh4js8_rishabh-pant-training-bcci_625x300_22_October_24.jpg?im=FeatureCrop,algorithm=dnn,width=806,height=605',
    'https://feeds.abplive.com/onecms/images/uploaded-images/2022/07/04/0c50b24fc05eed4bcd44312f3c0905261656934527_original.jpg',
    'https://images.cnbctv18.com/uploads/2024/04/pant-2024-04-4d389f0ff3dc664376a68d4bc2f6936b.jpg?impolicy=website&width=1200&height=900',
  ];

  final List<String> postCaptions = [
    "Victory starts here!",
    "Chillin’ in style, on and off the field. 😎 #LifestyleGoals",
    "One team, one dream.",
    "Exploring new places and making memories. 🌍✈️ #Wanderlust",
    "Legends in the making.",
    "Balancing cricket and chill. 🏏✨ #LifeInBalance",
    "Chasing the ultimate glory.",
    "Fueling up with good food and great company. 🍔🍹 #Foodie",
    "Sweat, skill, and the spirit of the game. 🏆 #OnTheField",
    "Weekend vibes with my favorite people. 🥂 #GoodTimes",
    "Every run counts, every moment matters. #CricketLife",
    "Fashion meets function. Always dressed to impress. 👕👖 #OOTD",
    "Swinging for the fences and beyond. 🚀 #BigHits",
    "Casual days, stylish ways. 👟🧢 #StreetStyle",
    "Teamwork makes the dream work. 🤝 #SquadGoals"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF212121),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-7tm6uC0DqO_ZN-QlA8o3X9alxROhBLi1rw&s"),
                    ),
                    const Text(
                      "Rishabh Pant",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const Text(
                      "@rishabpant",
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Followers and Following
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "2.3M",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Followers",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: Colors.white,
                      thickness: 2,
                    ),
                    Column(
                      children: [
                        Text(
                          "162",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Following",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Sports List
                const Text(
                  "Sports",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 24),
                SportsList(),
                const SizedBox(height: 24),
                const Text(
                  "Posts",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: postImages.length,
                  itemBuilder: (context, index) {
                    return ProfilePostWidget(
                      imageUrl: postImages[index],
                      index: index,
                      postImages: postImages,
                      postCaptions: postCaptions,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
