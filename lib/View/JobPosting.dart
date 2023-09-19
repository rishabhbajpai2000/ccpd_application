import 'package:ccpd_application/Controllers/APICalls.dart';
import 'package:file_picker/file_picker.dart';
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
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 55),
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
              Text(
                'Company Name',
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: companyName,
                decoration: InputDecoration(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Job Profile ',
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: jobProfile,
                decoration: InputDecoration(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Job Description ',
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: jobDescription,
                decoration: InputDecoration(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Expected CTC ',
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: expectedCTC,
                decoration: InputDecoration(),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Registration Link ',
              ),
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: registrationLink,
                decoration: InputDecoration(),
              ),
              SizedBox(
                height: 20,
              ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
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
                  GestureDetector(
                    onTap: () async {
                      // String jDLink = "www.google.com";
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
}
