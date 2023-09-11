import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/view/profile/profile_user.dart';

import '../../../../controller/photo_controller.dart';
import '../../../../controller/user_profile_model.dart';

class ChangeInformation extends StatelessWidget {

  final UserProfileModel _userProfileModel = Get.put(UserProfileModel());

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _livingLocationController = TextEditingController();
  //final PhotoController controller = Get.put(PhotoController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 240,
                    decoration: const BoxDecoration(
                      // gradient: LinearGradient(
                      //   colors: [Color(0xFFF3F0FF), Color(0xFF3e2f87)],
                      //   begin: Alignment.topCenter,
                      //   end: Alignment.bottomCenter,
                      // ),
                      color: Color(0xFF3e2f87),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 30,
                          right: 110,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Container(
                              height: 40,
                              width: 200,
                              //color: Color.fromRGBO(250, 250, 250, 0.5),
                              child: const Text("تعديل الملف الشخصي",style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20
                                  ,color: Color(0xFF3e2f87)),)
                            ),
                          ),
                        ),

                        Positioned(
                          top: 35,
                          left: 340,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: Container(
                              height: 40,
                              width: 40,
                              color: const Color.fromRGBO(250, 250, 250, 0.5),

                              child: IconButton(
                                icon: const Icon(Icons.arrow_back,size: 30,color: Colors.white),

                                onPressed: () {
                                  Get.to(const ProfileUser());
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 120,
               // left: 30,
                child: Container(
                  height: 600,
                  width: 410,
                  decoration: const BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Color(0xff574991),
                    //     offset: Offset(0, 6),
                    //     blurRadius: 12,
                    //     spreadRadius: 6,
                    //   ),
                    // ],
                    color:  Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                ),
              ),
      //SizedBox(height: 40,),
      Column(
      children: [
      //   const SizedBox(height: 60,),
      // Column(
      //   children: [
      //     Obx(() {
      //       final selectedImage = controller.selectedImage.value;

      //       return selectedImage != null
      //           ? Container(
      //         width: 100,
      //         height: 100,
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           image: DecorationImage(
      //             image: FileImage(selectedImage),
      //             fit: BoxFit.cover,
      //           ),
      //         ),
      //       )
      //           : const Icon(Icons.person, size: 100);
      //     }),
      //     IconButton(
      //       alignment: Alignment.topLeft,
      //       icon: const Icon(Icons.camera_alt,size: 30,),

      //         onPressed: () => controller.pickImage(),

      //     ),

      //   ],
      // ),






      Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.4,
            margin: const EdgeInsets.only(bottom: 10,left: 20,right: 15),
            child: TextFormField(
            controller: _nameController,
              textAlign: TextAlign.right,
              cursorColor:  const Color(0xFF6A57D5),
              keyboardType: TextInputType.name,
              //obscureText: true,
              style: const TextStyle(color: Color(0xFF6A57D5)),
            decoration: InputDecoration(
//fillColor:  Color(0xFF9BC7F9),
// Setting the fill color
//filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: Color(0xFFF3F0FF),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                  color: Color(0xFF6A57D5),
                ),
              ),

// label: ,
            hintText: ' الاسم',
            hintStyle:const TextStyle(color: Colors.grey,fontSize: 20),

            ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width*0.4,
            margin: const EdgeInsets.only(bottom: 10,left: 20,right: 15),
            child: TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
//fillColor:  Color(0xFF9BC7F9),
// Setting the fill color
//filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Color(0xFFF3F0FF),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(
                    color: Color(0xFF6A57D5),
                  ),
                ),

// label: ,
                hintText: ' العمر',
                hintStyle:const TextStyle(color: Colors.grey,fontSize: 20),

              ),
            ),
          ),



        ],

      ),


        Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.4,
              margin: const EdgeInsets.only(bottom: 10,left: 20,right: 15),
              child: TextFormField(
                controller: _livingLocationController,
                textAlign: TextAlign.right,
                cursorColor:  Color(0xFF6A57D5),
                keyboardType: TextInputType.name,
                //obscureText: true,
                style: const TextStyle(color: Color(0xFF6A57D5)),
                decoration: InputDecoration(
//fillColor:  Color(0xFF9BC7F9),
// Setting the fill color
//filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: Color(0xFFF3F0FF),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: Color(0xFF6A57D5),
                    ),
                  ),

// label: ,
                  hintText: ' مكان السكن',
                  hintStyle:const TextStyle(color: Colors.grey,fontSize: 20),

                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width*0.4,
              margin: const EdgeInsets.only(bottom: 10,left: 20,right: 15),
              child: TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
//fillColor:  Color(0xFF9BC7F9),
// Setting the fill color
//filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: Color(0xFFF3F0FF),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: Color(0xFF6A57D5),
                    ),
                  ),

// label: ,
                  hintText: ' رقم الهاتف',
                  hintStyle:const TextStyle(color: Colors.grey,fontSize: 20),

                ),
              ),
            ),



          ],

        ),





        ListTile(
      title: Container(
        width: MediaQuery.of(context).size.width*0.4,
        margin: const EdgeInsets.only(bottom: 10,left: 50,right: 50),
        child: TextFormField(
        controller: _currentPasswordController,
          obscureText: true,
        decoration: InputDecoration(
//fillColor:  Color(0xFF9BC7F9),
// Setting the fill color
//filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Color(0xFFF3F0FF),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(
              color: Color(0xFF6A57D5),
            ),
          ),

// label: ,
        hintText: 'كلمة السر الحالية',
        hintStyle:const TextStyle(color: Colors.grey,fontSize: 20),

        ),
        ),
      ),
      ),
      ListTile(
      title: Container(
        width: MediaQuery.of(context).size.width*0.4,
        margin: const EdgeInsets.only(bottom: 10,left: 50,right: 50),
        child: TextFormField(
        controller: _newPasswordController,
          obscureText: true,
        decoration: InputDecoration(
//fillColor:  Color(0xFF9BC7F9),
// Setting the fill color
//filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Color(0xFFF3F0FF),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Color(0xFF6A57D5),
            ),
          ),

// label: ,
        hintText: 'كلمة السر الجديدة',
        hintStyle:TextStyle(color: Colors.grey,fontSize: 20),

        ),
        ),
      ),
      ),
      ListTile(
      title: Container(
        width: MediaQuery.of(context).size.width*0.4,
        margin: const EdgeInsets.only(bottom: 5,left: 50,right: 50),
        child: TextFormField(
        controller: _confirmNewPasswordController,
          obscureText: true,
        decoration: InputDecoration(
//fillColor:  Color(0xFF9BC7F9),
// Setting the fill color
//filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Color(0xFFF3F0FF),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color: Color(0xFF6A57D5),
            ),
          ),
// label: ,
        hintText: 'تأكيد كلمة السر الجديدة',
        hintStyle:TextStyle(color: Colors.grey,fontSize: 20),

        ),
        ),
      ),
      ),
      SizedBox(height: 15),
      GestureDetector(
      onTap: () async {


      String newName = _nameController.text;
      int newAge = int.tryParse(_ageController.text) ?? 0;
      String newphone = _phoneController.text;
      String newliving_location = _livingLocationController.text;
      String currentPassword = _currentPasswordController.text;
      String newPassword = _newPasswordController.text;
      String confirmNewPassword = _confirmNewPasswordController.text;

      bool success = await _userProfileModel.editProfile(
      newName,
      newAge,
      newphone,
      newliving_location,
      currentPassword,
      newPassword,
      confirmNewPassword,
      );
      if (success) {
      Get.snackbar(
      'نجاح',
      'تم تعديل معلوماتك بنجاح.',
      snackPosition: SnackPosition.BOTTOM,

      );
      Get.to(()=>const ProfileUser());
//await _userProfileModel.fetchUserProfile();
      } else {
        Get.snackbar(
          'خطأ',
          'كلمات السر غير متطابقة',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
      },
      child: Container(

      margin: const EdgeInsets.only(left: 100, right: 100),
      decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(15),
      color: const Color(0xFF6A57D5),
      ),
      child: const Center(
      child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
      'حفظ',
      style: TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.w500,
      fontFamily: 'DGShameless',
      ),
      ),
      ),
      ),
      ),
      )
      ],
      )

            ],
          )
      ),
    );
  }
}
