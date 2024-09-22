import 'package:flutter/material.dart';

class ChatbotPage extends StatelessWidget {
  const ChatbotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ about Dengue in Sri Lanka'),
        backgroundColor: Colors.green,
      ),
      body: const FAQList(),
    );
  }
}

class FAQList extends StatelessWidget {
  const FAQList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        FAQItem(
          question: 'What is Dengue Fever?',
          answer: 'Dengue fever is a mosquito-borne viral infection causing flu-like symptoms. It can develop into severe dengue, leading to serious complications and even death if untreated.',
        ),
        FAQItem(
          question: 'How is Dengue transmitted?',
          answer: 'Dengue is transmitted by the bite of an infected Aedes mosquito, particularly Aedes aegypti and Aedes albopictus.',
        ),
        FAQItem(
          question: 'What are the symptoms of Dengue?',
          answer: 'Common symptoms include high fever, severe headache, pain behind the eyes, joint and muscle pain, rash, and mild bleeding.',
        ),
        FAQItem(
          question: 'Is there a vaccine for Dengue?',
          answer: 'There is a vaccine available, but it is only recommended for people who have previously been infected with dengue virus.',
        ),
        FAQItem(
          question: 'How can I prevent Dengue?',
          answer: 'Preventing mosquito bites by using repellents, wearing long sleeves, and eliminating standing water where mosquitoes breed are key preventive measures.',
        ),
        FAQItem(
          question: 'What should I do if I suspect Dengue?',
          answer: 'Seek medical attention immediately if you suspect dengue. Early diagnosis and proper medical care can prevent complications.',
        ),
        FAQItem(
          question: 'What are the risk factors for Dengue?',
          answer: 'Living or traveling in tropical and subtropical areas, such as Sri Lanka, increases your risk of exposure to the viruses that cause dengue fever.',
        ),
        FAQItem(
          question: 'How is Dengue diagnosed?',
          answer: 'Dengue is diagnosed through laboratory tests that detect the virus or antibodies in the blood.',
        ),
        FAQItem(
          question: 'What are the treatments for Dengue?',
          answer: 'There is no specific treatment for dengue. Supportive care, such as pain relievers, fluids, and rest, is recommended. Severe cases may require hospitalization.',
        ),
        FAQItem(
          question: 'Can Dengue be fatal?',
          answer: 'Yes, severe dengue can be fatal if not treated promptly. Severe dengue is a leading cause of serious illness and death in some Asian and Latin American countries.',
        ),
        FAQItem(
          question: 'What should I do to help prevent Dengue in my community?',
          answer: 'Keep your surroundings clean by removing stagnant water where mosquitoes can breed. Participate in community programs aimed at reducing the mosquito population.',
        ),
        FAQItem(
          question: 'How does climate change affect Dengue?',
          answer: 'Climate change can increase the range and seasonality of Aedes mosquitoes, potentially leading to more frequent and widespread dengue outbreaks.',
        ),
        FAQItem(
          question: 'Can Dengue be transmitted from person to person?',
          answer: 'No, dengue cannot be transmitted directly from person to person. It is spread through the bite of an infected mosquito.',
        ),
      ],
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const FAQItem({super.key, required this.question, required this.answer});

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(
          widget.question,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.answer),
          ),
        ],
        onExpansionChanged: (expanded) {
          setState(() {
            _isExpanded = expanded;
          });
        },
      ),
    );
  }
}
