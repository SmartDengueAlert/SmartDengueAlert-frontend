import 'package:flutter/material.dart';


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
                SectionTitle(title: 'How Does Dengue Spread?'),
                SectionContent(
                  text: [
                    TextSpan(
                      text: 'Dengue is primarily spread through the bite of an infected Aedes mosquito. Here’s how the transmission cycle works:',
                    ),
                    TextSpan(
                      text: '\n● Mosquito Bite: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'A mosquito bites a person infected with the dengue virus.',
                    ),
                    TextSpan(
                      text: '\n● Virus Transmission: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'The mosquito becomes infected with the virus.',
                    ),
                    TextSpan(
                      text: '\n● Subsequent Bites: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'The infected mosquito bites another person, transmitting the virus to them.',
                    ),
                    TextSpan(
                      text: '\n● Human-to-Mosquito: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'The cycle continues as other mosquitoes bite the newly infected person, spreading the virus further.',
                    ),
                  ],
                ),
                SectionTitle(title: 'Symptoms of Dengue'),
                SectionContent(
                  text: [
                    TextSpan(
                      text: 'Common symptoms of dengue include:',
                    ),
                    TextSpan(
                      text: '\n● High fever',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n● Severe headache',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n● Pain behind the eyes',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n● Joint and muscle pain',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n● Nausea and vomiting',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n● Skin rash',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n● Mild bleeding (such as nosebleeds or easy bruising)',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                  image: 'assets/images/fever-symptoms.jpg',
                ),
                SectionTitle(title: 'How to Prevent the Spread of Dengue'),
                SectionContent(
                  text: [
                    TextSpan(
                      text: 'To protect yourself and prevent the spread of dengue, follow these tips:',
                    ),
                    TextSpan(
                      text: '\n● Use Mosquito Repellent: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Apply repellent on exposed skin and clothing.',
                    ),
                    TextSpan(
                      text: '\n● Wear Protective Clothing: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Wear long-sleeved shirts, long pants, socks, and shoes when outdoors.',
                    ),
                    TextSpan(
                      text: '\n● Eliminate Standing Water: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Remove or cover containers that can hold water to reduce mosquito breeding sites.',
                    ),
                    TextSpan(
                      text: '\n● Use Mosquito Nets: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Sleep under mosquito nets, especially in areas where dengue is common.',
                    ),
                    TextSpan(
                      text: '\n● Keep Mosquitoes Out: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Use screens on doors and windows, and use air conditioning if possible.',
                    ),
                  ],
                  image: 'assets/images/dengue_prevent.jpg',
                ),
                SectionTitle(title: 'How Does the App Work?'),
                SectionContent(
                  text: [
                    TextSpan(
                      text: 'Our dengue prediction app uses machine learning algorithms to analyze various factors that contribute to the spread of dengue fever, including:',
                    ),
                    TextSpan(
                      text: '\n● Weather Patterns',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n● Mosquito Breeding Habits',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n● Population Density',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '\n● Historical Dengue Outbreak Data',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
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
                      text: '\n● Real-time Updates: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Stay informed about dengue outbreaks and weather conditions in your area.',
                    ),
                    TextSpan(
                      text: '\n● Prevention Tips: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Get expert advice on how to prevent dengue fever, including mosquito repellent recommendations and more.',
                    ),
                    TextSpan(
                      text: '\n● Symptom Checker: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Identify symptoms of dengue fever and get guidance on what to do next.',
                    ),
                  ],
                ),
                SectionTitle(title: 'How to Use the App'),
                SectionContent(
                  text: [
                    TextSpan(
                      text: '1. Allow Location Access: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Grant the app permission to access your location to get accurate risk scores and updates.',
                    ),
                    TextSpan(
                      text: '\n2. Enter Your Location: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Input your city or zip code to get started.',
                    ),
                    TextSpan(
                      text: '\n3. View Your Risk Score: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Check your personalized risk score and take necessary precautions.',
                    ),
                    TextSpan(
                      text: '\n4. Stay Informed: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Receive real-time updates and prevention tips to stay safe.',
                    ),
                  ],
                ),
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
                      text: '\n● Make informed decisions: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Use our app to plan your daily activities, travel, and outdoor events with confidence.',
                    ),
                    TextSpan(
                      text: '\n● Contribute to a safer community: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'By using our app, you\'re helping us collect valuable data to improve dengue prediction and prevention efforts.',
                    ),
                  ],
                ),
                // Add this section to include the image at the end of the page
                SectionContent(
                  text: [
                    TextSpan(
                      text: '', // Empty text span
                    ),
                  ],
                  image: 'assets/images/dengue.jpg', // Path to your end image
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'Merriweather', // Change font family
          letterSpacing: 1.0,  // Adjust letter spacing
        ),
      ),
    );
  }
}

class SectionContent extends StatelessWidget {
  final List<TextSpan> text;
  final String? image;

  const SectionContent({super.key, required this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (image != null) Image.asset(image!, fit: BoxFit.cover),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: 'Roboto', // Change font family
              ),
              children: _addSpacingBetweenSentences(text),
            ),
          ),
        ],
      ),
    );
  }

  List<InlineSpan> _addSpacingBetweenSentences(List<TextSpan> textSpans) {
    List<InlineSpan> spacedTextSpans = [];
    for (var span in textSpans) {
      spacedTextSpans.add(span);
      spacedTextSpans.add(const WidgetSpan(child: SizedBox(height: 8)));
    }
    return spacedTextSpans;
  }
}
