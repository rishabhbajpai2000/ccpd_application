import 'package:ccpd_application/Controllers/APICalls.dart';
import 'package:ccpd_application/Controllers/Utils.dart';
import 'package:ccpd_application/ReusableComponents/FormFields.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JobPosting extends StatefulWidget {
  const JobPosting({Key? key}) : super(key: key);

  @override
  State<JobPosting> createState() => _JobPostingState();
}

class _JobPostingState extends State<JobPosting> {

  final companyName = TextEditingController();
  final jobProfile = TextEditingController();
  final jobDescription = TextEditingController();
  final expectedCTC = TextEditingController();
  final registrationLink = TextEditingController();
  final registrationEndDate = TextEditingController();
  PlatformFile? pickedFile;
  bool documentSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: logout,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 40),
                  child: Row(
                    children: [
                      Text(
                        'Post a Job',
                        style:
                            TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              formField(
                  Heading: "Company Name",
                  controller: companyName,
                  numericalKeyboard: false),
              formField(
                  Heading: "Job Profile",
                  controller: jobProfile,
                  numericalKeyboard: false),
              formField(
                  Heading: "Job Description",
                  controller: jobDescription,
                  numericalKeyboard: false),
              formField(
                  Heading: "Expected CTC",
                  controller: expectedCTC,
                  numericalKeyboard: true),
              formField(
                  Heading: "Registration Link",
                  controller: registrationLink,
                  numericalKeyboard: false),

              // Registration End Date
              Text(
                'Registration End Date ',
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: registrationEndDate,
                decoration: InputDecoration(),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 5),
                      lastDate: DateTime(2101));
                  if (pickedDate != null) {
                    setState(() {
                      registrationEndDate.text =
                          DateFormat('dd/MM/yyyy').format(pickedDate);
                    });
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),

              // Upload Document
              Text("Upload Document"),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  selectFile();
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffF2F3F7),
                  child: Center(
                      child: Text(
                    documentSelected == false
                        ? "Upload Document"
                        : pickedFile!.name,
                    style: TextStyle(fontSize: 18),
                  )),
                ),
              ),
              SizedBox(
                height: 20,
              ),


              // discard and save buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      companyName.clear();
                      jobProfile.clear();
                      jobDescription.clear();
                      expectedCTC.clear();
                      registrationLink.clear();
                      registrationEndDate.clear();
                      setState(() {
                        pickedFile = null;
                        documentSelected = false;
                      });
                    },
                    child: Container(
                      width: 130,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Discard',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (validateInput()) {
                        String jDLink =
                            await APICalls().getTheJDLink(file: pickedFile);
                        await APICalls.postTheJob(
                            companyName: companyName.text,
                            jobProfile: jobProfile.text,
                            jobDescription: jobDescription.text,
                            expectedCTC: expectedCTC.text,
                            registrationLink: registrationLink.text,
                            jDLink:
                                jDLink, // TODO: generate a link through firebase
                            registrationEndDate: registrationEndDate.text);
                      }
                    },
                    child: Container(
                      width: 130,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xff8E97FD),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result == null) return;

    setState(() {
      documentSelected = true;
      pickedFile = result.files.first;
    });
  }

  bool validateInput() {
    if (companyName.text.isEmpty) {
      Utils.toastMessage("Company Name cannot be empty");
      return false;
    } else if (jobProfile.text.isEmpty) {
      Utils.toastMessage("Job Profile cannot be empty");
      return false;
    } else if (jobDescription.text.isEmpty) {
      Utils.toastMessage("Job Description cannot be empty");
      return false;
    } else if (expectedCTC.text.isEmpty) {
      Utils.toastMessage("Expected CTC cannot be empty");
      return false;
    } else if (registrationLink.text.isEmpty) {
      Utils.toastMessage("Registration Link cannot be empty");
      return false;
    } else if (registrationEndDate.text.isEmpty) {
      Utils.toastMessage("Registration End Date cannot be empty");
      return false;
    } else if (pickedFile == null) {
      Utils.toastMessage("Please select a document");
      return false;
    }
    return true;
  }
    void logout() async {
    try {
      // Sign the user out using FirebaseAuth
      await FirebaseAuth.instance.signOut();

      // Navigate to the login screen after successful logout
      Navigator.pushNamedAndRemoveUntil(
          context, 'initial_Welcome_Screen', (route) => false);
    } catch (e) {
      // Handle any potential errors during the logout process
      print('Error during logout: $e');
    }
  }
}
