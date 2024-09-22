import 'package:flutter/material.dart';

import 'chatbot_page.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150.0), // Set the height you want
        child: AppBar(
          title: null, // Remove the text title
          backgroundColor: Colors.transparent, // Set background to transparent
          elevation: 0, // Remove shadow
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset(
              'assets/images/appbarbg.png', // Your image path
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: InteractiveViewer(
        panEnabled: true,
        boundaryMargin: const EdgeInsets.all(20),
        minScale: 0.5,
        maxScale: 4.0,
        child: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(title: 'What is Dengue?'),
                SectionContent(
                  text: [
                    TextSpan(
                      text: 'Dengue is a viral disease spread by the bite of an infected mosquito. It is a major public health concern in many parts of the world, causing severe flu-like symptoms, and in some cases, life-threatening complications.',
                    ),
                  ],
                ),
                SizedBox(height: 20), // Add space between sections
                SectionTitle(title: 'How Does Dengue Spread?'),
                SectionContent(
                  text: [
                    TextSpan(
                      text: 'Dengue is primarily spread through the bite of an infected Aedes mosquito. Here’s how the transmission cycle works:',
                    ),
                    TextSpan(
                      text: '\n\n● Mosquito Bite: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'A mosquito bites a person infected with the dengue virus.',
                    ),
                    TextSpan(
                      text: '\n\n● Virus Transmission: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'The mosquito becomes infected with the virus.',
                    ),
                    TextSpan(
                      text: '\n\n● Subsequent Bites: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'The infected mosquito bites another person, transmitting the virus to them.',
                    ),
                    TextSpan(
                      text: '\n\n● Human-to-Mosquito: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'The cycle continues as other mosquitoes bite the newly infected person, spreading the virus further.',
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SectionTitle(title: 'Symptoms of Dengue'),
                SectionContent(
                  text: [
                    TextSpan(
                      text: 'Common symptoms of dengue include:',
                    ),
                    TextSpan(
                      text: '\n\n● High fever',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n\n● Severe headache',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n\n● Pain behind the eyes',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n\n● Joint and muscle pain',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n\n● Nausea and vomiting',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n\n● Skin rash',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n\n● Mild bleeding (such as nosebleeds or easy bruising)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                  image: 'assets/images/fever-symptoms.jpg',
                ),
                SizedBox(height: 20),
                SectionTitle(title: 'How to Prevent the Spread of Dengue'),
                SectionContent(
                  text: [
                    TextSpan(
                      text: 'To protect yourself and prevent the spread of dengue, follow these tips:',
                    ),
                    TextSpan(
                      text: '\n\n● Use Mosquito Repellent: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Apply repellent on exposed skin and clothing.',
                    ),
                    TextSpan(
                      text: '\n\n● Wear Protective Clothing: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Wear long-sleeved shirts, long pants, socks, and shoes when outdoors.',
                    ),
                    TextSpan(
                      text: '\n\n● Eliminate Standing Water: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Remove or cover containers that can hold water to reduce mosquito breeding sites.',
                    ),
                    TextSpan(
                      text: '\n\n● Use Mosquito Nets: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Sleep under mosquito nets, especially in areas where dengue is common.',
                    ),
                    TextSpan(
                      text: '\n\n● Keep Mosquitoes Out: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Use screens on doors and windows, and use air conditioning if possible.',
                    ),
                  ],
                  image: 'assets/images/dengue_prevent.jpg',
                ),
                SizedBox(height: 20),
                SectionTitle(title: 'How Does the App Work?'),
                SectionContent(
                  text: [
                    TextSpan(
                      text: 'Our dengue prediction app uses machine learning algorithms to analyze various factors that contribute to the spread of dengue fever, including:',
                    ),
                    TextSpan(
                      text: '\n\n● Weather Patterns',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n\n● Mosquito Breeding Habits',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n\n● Population Density',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n\n● Historical Dengue Outbreak Data',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SectionTitle(title: 'Features'),
                SectionContent(
                  text: [
                    TextSpan(
                      text: '● Dengue Risk Score: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Get a personalized risk score based on your location and other factors.',
                    ),
                    TextSpan(
                      text: '\n\n● Real-time Updates: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Stay informed about dengue outbreaks and weather conditions in your area.',
                    ),
                    TextSpan(
                      text: '\n\n● Prevention Tips: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Get expert advice on how to prevent dengue fever, including mosquito repellent recommendations and more.',
                    ),
                    TextSpan(
                      text: '\n\n● Symptom Checker: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Identify symptoms of dengue fever and get guidance on what to do next.',
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SectionTitle(title: 'How to Use the App'),
                SectionContent(
                  text: [
                    TextSpan(
                      text: '1. Allow Location Access: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Grant the app permission to access your location to get accurate risks and updates.',
                    ),
                    TextSpan(
                      text: '\n\n2. Enter Your Location: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Input your city or zip code to get started.',
                    ),
                    TextSpan(
                      text: '\n\n3. View Your Risk : ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Check your personalized risk and take necessary precautions.',
                    ),
                    TextSpan(
                      text: '\n\n4. Stay Informed: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Receive real-time updates and prevention tips to stay safe.',
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SectionTitle(title: 'Why Use Our App?'),
                SectionContent(
                  text: [
                    TextSpan(
                      text: '● Stay ahead of dengue outbreaks: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Get early warnings and take proactive measures to protect yourself and your loved ones.',
                    ),
                    TextSpan(
                      text: '\n\n● Personalized risk assessment: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Receive a risk score based on your specific location and circumstances.',
                    ),
                    TextSpan(
                      text: '\n\n● Expert advice at your fingertips: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Access prevention tips and guidance from experts in public health and mosquito control.',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatbotPage()),
          );
        },
        backgroundColor: Colors.blue, // Set your desired color
        child: Image.asset(
          'assets/images/chatbot.jpg', // Replace Icon with Image
          height: 40, // Adjust size as needed
          width: 40,
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class SectionContent extends StatelessWidget {
  final List<TextSpan> text;
  final String? image;

  const SectionContent({required this.text, this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (image != null) ...[
          Image.asset(image!),
          const SizedBox(height: 10),
        ],
        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
              height: 1.5, // Adjust line height for readability
            ),
            children: text,
          ),
        ),
      ],
    );
  }
}
