import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _current = 0;
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> _onboardingData = [
    {

      "question": "What is your name?",
      "image": 'images/112.jpeg',
      "inputType": TextInputType.name,
      "hintText": "Name"
    },
    {
      "image": 'images/113.jpeg',
      "question": "When were you born?",
      "inputType": TextInputType.datetime,
      "hintText": "Date/Month/Year"
    },
    {
      "image": 'images/114.jpeg',
      "question": "What skills do you have?",
      "inputType": TextInputType.text,
      "hintText": "Skills"
    },
  ];

  Widget _buildInputField({required String hintText, required TextInputType inputType}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: TextField(
        keyboardType: inputType,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hintText,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _onboardingData.length,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      Text(
                        _onboardingData[index]['question'],
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      Image.asset(
                        _onboardingData[index]['image'],
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.5,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      _buildInputField(
                        hintText: _onboardingData[index]['hintText'],
                        inputType: _onboardingData[index]['inputType'],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _onboardingData.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _pageController.animateToPage(entry.key,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
