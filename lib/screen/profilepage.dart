import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.jpg'),
                    radius: 30,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Take Care!',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Richa Bose',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            _buildSectionTitle('Settings'),
            _buildSettingsItem(
              icon: Icons.notifications_outlined,
              title: 'Notification',
              subtitle: 'Check your medicine notification',
            ),
            _buildSettingsItem(
              icon: Icons.volume_up_outlined,
              title: 'Sound',
              subtitle: 'Ring, Silent, Vibrate',
            ),
            _buildSettingsItem(
              icon: Icons.person_outline,
              title: 'Manage Your Account',
              subtitle: 'Password, Email ID, Phone Number',
            ),
            _buildSettingsItem(
              icon: Icons.notifications_outlined,
              title: 'Notification',
              subtitle: 'Check your medicine notification',
            ),
            _buildSettingsItem(
              icon: Icons.notifications_outlined,
              title: 'Notification',
              subtitle: 'Check your medicine notification',
            ),
            _buildSectionTitle('Device'),
            _buildDeviceItem(
              icon: Icons.volume_up_outlined,
              title: 'Connect',
              subtitle: 'Bluetooth, Wi-Fi',
            ),
            _buildDeviceItem(
              icon: Icons.volume_up_outlined,
              title: 'Sound Option',
              subtitle: 'Ring, Silent, Vibrate',
            ),
            _buildSectionTitle('Caretakers: 03'),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCaretakerAvatar('Dipa Luna', 'assets/profile.jpg'),
                  _buildCaretakerAvatar('Roz Sod.', 'assets/profile.jpg'),
                  _buildCaretakerAvatar('Sunny Tu.', 'assets/profile.jpg'),
                  _buildAddCaretakerButton(),
                ],
              ),
            ),
            _buildSectionTitle('Doctor'),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 25,
                    child: Icon(Icons.add, color: Colors.white, size: 30),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Add Your Doctor',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Or use ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'invite link',
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildAdditionalOption('Privacy Policy'),
            _buildAdditionalOption('Terms of Use'),
            _buildAdditionalOption('Rate Us'),
            _buildAdditionalOption('Share'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 15.0, bottom: 5.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.grey[800],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600], size: 24),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600], size: 24),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCaretakerAvatar(String name, String imagePath) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[300],
          radius: 25,
          child: const Icon(Icons.person, color: Colors.white),
        ),
        const SizedBox(height: 5),
        Text(
          name,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildAddCaretakerButton() {
    return const Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 25,
          child: Icon(Icons.add, color: Colors.grey),
        ),
        SizedBox(height: 5),
        Text(
          'Add',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildAdditionalOption(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
