import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:x_fitness/constant/images.dart';
import 'package:x_fitness/constant/color_Utils.dart';
import 'package:x_fitness/constant/screen_Size.dart';
import 'package:x_fitness/constant/spacer.dart';
import 'package:x_fitness/widgets/MyTextField.dart';
import 'package:x_fitness/widgets/back_button.dart';
import 'package:x_fitness/widgets/my_Button.dart';
import 'package:x_fitness/widgets/my_Text.dart';
import 'Add_Device_Screen/RingSizeCalculate/RingSizeCalculate.dart';
import 'package:intl/intl.dart';
class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}
class _UserInfoScreenState extends State<UserInfoScreen> {
  final TextEditingController userNameCtr = TextEditingController();
  final TextEditingController userHeightCtr = TextEditingController(text: '165');
  final TextEditingController userWeightCtr = TextEditingController(text: '50');
  String selectedGender = 'Male';
  bool isDropdownOpen = false;

  int _selectedYear = 2025;
  int _selectedMonth = 1;
  int _selectedDay = 1;

  final List<String> genderOptions = ['Male', 'Female'];


  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            datePickerTheme: DatePickerThemeData(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                )
            ),
            primaryColor: Colors.blue, // Header color
            hintColor: Colors.blue,   // Selected date color
            colorScheme: ColorScheme.light(primary: Colors.blue),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },

    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  String formatSelectedDate(DateTime? date) {
    if (date == null) {
      return 'Date Of Birth*';
    }
    return DateFormat('yyyy-MM-dd').format(date);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.black,
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.greyTopTOBlackBottom),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              centerTitle: true,
              leading:  Padding(
                padding: const EdgeInsets.only(left: 10),
                child: MyBackButton(onTap: () => Navigator.pop(context)),
              ),
              title:  TextWidget(
              title: 'User Info',
              fontSize: 18,
              textAlign: TextAlign.center,
              textColor: ColorUtils.white,
              fontWeight: FontWeight.bold,
              ),
              automaticallyImplyLeading: false,
              pinned: true,
              expandedHeight: 195,
              backgroundColor: Colors.black,
              surfaceTintColor: Colors.black,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(13)),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: AppGradients.greyTopTOBlackBottom,
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(13)),
                  ),
                  child: SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        VerticalSpace(height: 50),
                        GestureDetector(
                          // onTap:() {
                          //   /// is pe user click kare to modelBotto sheet open hona chaiye
                          //   /// us me 3 option diye diya jyega
                          //   /// photo album pe click kare to photo ka album open hona chaiye phone ka
                          //   /// camera pe clik kare to phone ka camera open hona chaiye
                          //   /// cancel pe click kare to model bottom sheet close hona chaye
                          // },
                          onTap: _showPhotoOptions,
                          child: Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: _selectedImage != null
                                    ? FileImage(File(_selectedImage!.path)) as ImageProvider
                                    : const AssetImage('Assets/background/user.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(45),
                              border: Border.all(color: Colors.greenAccent, width: 2),
                            ),
                          ),
                        ),
                        VerticalSpace(height: 10),
                        TextWidget(
                          title: 'Sagar Kumar',
                          fontSize: 18,
                          textAlign: TextAlign.start,
                          textColor: ColorUtils.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            /// Main Body
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VerticalSpace(height: 10),
                    buildLabel('User Name*'),
                    buildTextField(
                        userNameCtr,
                        hintText: 'Please enter your username',
                      prefix: Container(
                          padding: EdgeInsets.only(left: 5),
                          height : 35,
                          width:30,
                          child: Center(
                              child: Image(image: AssetImage(ImagesUtils.meIcon),
                                height: 20,color: Colors.greenAccent,)
                          )
                      ),
                    ),
                    VerticalSpace(height: 10),
                    buildLabel('Height*'),
                    buildTextField(
                      prefix: Container(
                          padding: EdgeInsets.only(left: 5),
                          height : 40,
                          width:40,
                          child: Center(
                              child: Image(image: AssetImage(ImagesUtils.height),
                                height: 40,color: Colors.greenAccent,)
                          )
                      ),
                      maxLength: 3,
                      userHeightCtr,
                      keyboardType: TextInputType.number,
                      suffixText: 'cm',
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                    VerticalSpace(height: 10),
                    buildLabel('Weight*'),
                    buildTextField(
                      prefix: Container(
                          padding: EdgeInsets.only(left: 5),
                          height : 40,
                          width:40,
                          child: Center(
                              child: Image(image: AssetImage(ImagesUtils.weight),
                                height: 30,color: Colors.greenAccent,)
                          )
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      userWeightCtr,
                      keyboardType: TextInputType.number,
                      maxLength: 3,
                      suffixText: 'kg',
                    ),
                    VerticalSpace(height: 10),
                    buildLabel('Gender*'),
                    buildGenderDropdown(),
                    VerticalSpace(height: 10),
                    buildLabel('DOB*'),
                    GestureDetector(
                      onTap:  ()=>_selectDate(context),
                      child: Container(
                        height: 53,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(color: ColorUtils.white.withOpacity(0.5)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                height: 35,
                                width: 30,
                                child: Center(
                                  child: Image.asset(
                                    ImagesUtils.dobGraph,
                                    height: 30,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                              ),
                              HorizontalSpace(width: 10),
                              TextWidget(
                                title: "${formatSelectedDate(selectedDate)}",
                                fontSize: 14,
                                textAlign: TextAlign.center,
                                textColor: ColorUtils.white,
                              ),
                              Spacer(),
                              Icon(Icons.calendar_month, color: ColorUtils.white),
                            ],
                          ),
                        ),
                      ),
                    ),
                    VerticalSpace(height: 30),
                    MyButton(
                      navigateTo: () {

                      },
                      buttonTextColor: ColorUtils.black,
                      buttonName: 'Save',
                      height: 50,
                      width: screenWidth(context),
                      borderRadius: 13,
                      buttonColor: ColorUtils.appGreen,
                    ),
                    VerticalSpace(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildGenderDropdown() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isDropdownOpen = !isDropdownOpen;
            });
          },
          child: Container(
            height: 53,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: isDropdownOpen
                  ? BorderRadius.only(topRight: Radius.circular(13), topLeft: Radius.circular(13))
                  : BorderRadius.circular(13),
              border: Border.all(
                color: isDropdownOpen ? ColorUtils.appGreen.withOpacity(0.7) : ColorUtils.white.withOpacity(0.5),width: 1.2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  SizedBox(
                    height : 35,
                    width:35,
                    child: Center(
                      child: Image.asset(
                        ImagesUtils.maleFemale,
                        height: 35,
                        color: Colors.greenAccent,
                      ),
                    ),
                  ),
                  HorizontalSpace(width: 10),
                  TextWidget(
                    title: selectedGender,
                    fontSize: 14,
                    textAlign: TextAlign.center,
                    textColor: ColorUtils.white,
                  ),
                  Spacer(),
                  Icon(isDropdownOpen?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down, color: ColorUtils.white),
                ],
              ),
            ),
          ),
        ),
        if (isDropdownOpen)
          Container(
            // margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border: Border.all(
                  color: isDropdownOpen ? ColorUtils.appGreen.withOpacity(0.7) : ColorUtils.white.withOpacity(0.5),
                ),
                // color: Colors.white,
                borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(13),
                bottomLeft: Radius.circular(13)
              )
            ),
            child: Column(
              children: genderOptions.map((gender) {
                return ListTile(
                  title: TextWidget(
                    title: gender,
                    fontSize: 14,
                    textAlign: TextAlign.start,
                    textColor: ColorUtils.white,
                  ),
                  onTap: () {
                    setState(() {
                      selectedGender = gender;
                      isDropdownOpen = false;
                    });
                  },
                );
              }).toList(),
            ),
          ),
      ],
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: TextWidget(
        title: text,
        fontSize: 14,
        textAlign: TextAlign.left,
        textColor: ColorUtils.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildTextField(
      TextEditingController controller, {
        String? hintText,
        TextInputType? keyboardType,
        String? suffixText,
        List<TextInputFormatter>? inputFormatters,
        int? maxLength,
        required Widget prefix
      }) {
    return MyTextField(
      inputFormatter: inputFormatters,
      controller: controller,
      borderRadius: 15,
      hintText: hintText,
      maxLength: maxLength,
      keyboardType: keyboardType,
      preFixIcon: prefix,
      suffixIcon: suffixText != null
          ? Container(
        padding: EdgeInsets.only(right: 10),
        height : 35,
        width:30,
            child: Center(
              child: TextWidget(
                title: suffixText,
                fontSize: 14,
                textAlign: TextAlign.left,
                textColor: ColorUtils.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
          : null,
    );
  }

  final ImagePicker _picker = ImagePicker();
  XFile? _selectedImage;

  void _showPhotoOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo),
              title: const Text('Photo Album'),
              onTap: () async {
                Navigator.pop(context);
                final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() {
                    _selectedImage = pickedFile;
                  });
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () async {
                Navigator.pop(context);
                final pickedFile = await _picker.pickImage(source: ImageSource.camera);
                if (pickedFile != null) {
                  setState(() {
                    _selectedImage = pickedFile;
                  });
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.cancel),
              title: const Text('Cancel'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

}



