import 'package:flutter/material.dart';

import '../widgets/base_screen.dart';


class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section
              Text(
                'Contact Us',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Team Member 1 Card
              _buildTeamMemberCard(
                'assets/images/person1.jpeg', // Add the path of the person's image here
                'Dr. Muhammad Aamer Maqsood',
                'Principle Investigator',
                'Professor',
                'mohamgill@uaf.edu.pk',
                '+92419201077 - Ext. 2923',
              ),
              SizedBox(height: 20),

              // Team Member 2 Card
              _buildTeamMemberCard(
                'assets/images/person2.jpg', // Add the path of the person's image here
                'Mr. Ahsan Raza Sattar',
                'Co - PI',
                'Assistant Professor.',
                'ahsan_raza@uaf.edu.pk',
                '+92419200829 - Ext. 3327',
              ),
              SizedBox(height: 20),

              // Team Member 3 Card
              _buildTeamMemberCard(
                'assets/images/person4.png', // Add the path of the person's image here
                'Hafiz Ali Naeem',
                'Researcher',
                'MS (Software Engineering)',
                'alinaeemwarraich@gmail.com',
                '+92 300 7987987',
              ),
              SizedBox(height: 20),

              // Team Member 4 Card
              _buildTeamMemberCard(
                'assets/images/person5.jpg', // Add the path of the person's image here
                'Muhammad Awais Khan',
                'Researcher',
                'BS (Computer Science)',
                'mawaiskhan1002@gmail.com',
                '+92 325 3199418',
              ),
              SizedBox(height: 20),

              // Team Member 5 Card
              _buildTeamMemberCard(
                'assets/images/person3.png', // Add the path of the person's image here
                'Muhammad Talha',
                'Researcher',
                'PHD (Soil Science)',
                'talhausman@live.com',
                '+92 335 7376526',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to build a team member card
  Widget _buildTeamMemberCard(
      String imagePath,
      String name,
      String designation,
      String description,
      String email,
      String phone,
      ) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Picture
            ClipOval(
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20), // Space between picture and text

            // Text Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),

                  // Designation
                  Text(
                    designation,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 10),

                  // Description
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  SizedBox(height: 10),

                  // Email
                  Text(
                    'Email: $email',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                  SizedBox(height: 5),

                  // Phone
                  Text(
                    'Phone: $phone',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
