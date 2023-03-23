/*
Prompt: The first field should be corner radios with a profile photo of the user, what when his click on the profile photo it lead to his gallery app to select a photo, by default the program will use a default profile photo from the app! Bellow a field with the name of the user, you can use "Gabriel Correia", bellow another a big field where the user can write a short biography of him self with 180 characters long, bellow a section with two date pickers, this section is called "Availability" where the user you provide two dates, for example from "7:00AM" to "1:00PM"; Bellow outside this section, a list of pickable tags that the user can added to his "Soft-skill" field, this tags should be have a droppable animation, the user will press in the tag and move to the user soft skills field and with capabilities of change the order of each skill by its desires, bellow this a adjustable scrowable bar of his desired price, from 50 to 200 BRL (brazilian currency), and at the final a green button called "Continue"
*/

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'tela_principal.dart';

class ProfileEditingScreen extends StatefulWidget {
  const ProfileEditingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileEditingScreenState createState() => _ProfileEditingScreenState();
}

class _ProfileEditingScreenState extends State<ProfileEditingScreen> {
  // ignore: unused_field
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {

  }

  // ignore: unused_field
  late String _name;
  // ignore: unused_field
  late String _bio;
  // ignore: unused_field
  late DateTime _startDate;
  // ignore: unused_field
  late DateTime _endDate;
  late double _desiredPrice;
  late final List<String> _softSkills = [
    'Team player',
    'Effective communicator',
    'Problem solver',
    'Adaptable',
    'Fast learner',
    'Organized',
    'Creative',
    'Detail-oriented',
    'Leadership skills',
    'Time management',
  ];
  // ignore: unused_field
  late final List<String> _selectedSkills = [];

  @override
  void initState() {
    super.initState();
    _image = null;
    _name = 'Gabriel Correia';
    _bio = '';
    _startDate = DateTime.now();
    _endDate = DateTime.now();
    _desiredPrice = 100;
  }

  Widget _buildTagItem(String tag, int index) {
  return Draggable(
    data: index,
    feedback: Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Text(
        tag,
        style: const TextStyle(fontSize: 16.0),
      ),
    ),
    childWhenDragging: const SizedBox(),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Text(
        tag,
        style: const TextStyle(fontSize: 16.0),
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: getImage,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/user.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Gabriel Correia',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: const TextField(
                  maxLength: 180,
                  decoration: InputDecoration(
                    hintText: 'Write a short bio about yourself...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text(
                        'From',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        height: 50.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child: Text('7:00 AM'),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'To',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        height: 50.0,
                        width: 120.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Center(
                          child: Text('1:00 PM'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              const Text(
                'Soft Skills',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        _buildTagItem('Communication', 0),
                        _buildTagItem('Teamwork', 1),
                        _buildTagItem('Leadership', 2),
                        _buildTagItem('Problem-solving', 3),
                        _buildTagItem('Time management', 4),
                        _buildTagItem('Adaptability', 5),
                        _buildTagItem('Creativity', 6),
                        _buildTagItem('Conflict resolution', 7),
                        _buildTagItem('Decision making', 8),
                        _buildTagItem('Organizational skills', 9),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Flexible(
                    child: DragTarget(
                      onAccept: (String data) {
                        setState(() {
                          _softSkills.add(data);
                        });
                      },
                      builder: (BuildContext context, List<String?> incoming, List<dynamic> rejected) {
                        return Container(
                          height: 200.0,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListView.builder(
                            itemCount: _softSkills.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                title: Text(_softSkills[index]),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    setState(() {
                                      _softSkills.removeAt(index);
                                    });
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Desired Price',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const SizedBox(width: 16.0),
                  const Text(
                    '50 R\$',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Slider(
                      value: _desiredPrice,
                      min: 50,
                      max: 200,
                      divisions: 30,
                      onChanged: (double value) {
                        setState(() {
                          _desiredPrice = value;
                        });
                      },
                    ),
                  ),
                  const Text(
                    '200 R\$',
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 16.0),
                ],
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()),);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}