import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zain_backend/models/user.dart';
import 'package:zain_backend/providers/user_provider.dart';
import 'package:zain_backend/services/user.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  TextEditingController addressController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    addressController =
        TextEditingController(text: userProvider.getUser()!.address.toString());
    nameController =
        TextEditingController(text: userProvider.getUser()!.name.toString());
    phoneController =
        TextEditingController(text: userProvider.getUser()!.phone.toString());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: nameController,
          ),
          TextFormField(
            controller: addressController,
          ),
          TextFormField(
            controller: phoneController,
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Name cannot be empty.")));
                      return;
                    }
                    if (addressController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Address cannot be empty.")));
                      return;
                    }
                    if (phoneController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Phone cannot be empty.")));
                      return;
                    }
                    try {
                      isLoading = true;
                      setState(() {});
                      await UserServices()
                          .updateProfile(UserModel(
                              name: nameController.text,
                              phone: phoneController.text,
                              address: addressController.text,
                              docId: userProvider.getUser()!.docId.toString()))
                          .then((val) async {
                        await UserServices()
                            .getUserByID(
                                userProvider.getUser()!.docId.toString())
                            .then((val) {
                          userProvider.setUser(val);

                          isLoading = false;
                          setState(() {});
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Message"),
                                  content: Text(
                                      "Profile has been updated successfully"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {}, child: Text("Okay"))
                                  ],
                                );
                              });
                        });
                      });
                    } catch (e) {
                      isLoading = false;
                      setState(() {});
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  },
                  child: Text("Update"))
        ],
      ),
    );
  }
}
