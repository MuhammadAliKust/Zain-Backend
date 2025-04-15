import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zain_backend/providers/user_provider.dart';
import 'package:zain_backend/views/edit_profile.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Column(
        children: [
          Text(
            userProvider.getUser()!.name.toString(),
            style: TextStyle(fontSize: 30),
          ),
          Text(
            userProvider.getUser()!.phone.toString(),
            style: TextStyle(fontSize: 30),
          ),
          Text(
            userProvider.getUser()!.address.toString(),
            style: TextStyle(fontSize: 30),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfileView()));
              },
              child: Text("Update Profile"))
        ],
      ),
    );
  }
}
