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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Take Care!'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.jpg'),
                    radius: 30,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Richa Bose',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Settings Section
            _buildSectionTitle('Settings'),
            _buildSettingsItem(
              icon: Icons.notifications,
              title: 'Notification',
              subtitle: 'Check your medicine notification',
            ),
            _buildSettingsItem(
              icon: Icons.volume_up,
              title: 'Sound',
              subtitle: 'Ring, Silent, Vibrate',
            ),
            _buildSettingsItem(
              icon: Icons.manage_accounts,
              title: 'Manage Your Account',
              subtitle: 'Password, Email ID, Phone Number',
            ),
            _buildSettingsItem(
              icon: Icons.notifications,
              title: 'Notification',
              subtitle: 'Check your medicine notification',
            ),
            _buildSettingsItem(
              icon: Icons.notifications,
              title: 'Notification',
              subtitle: 'Check your medicine notification',
            ),

            // Device Section
            _buildSectionTitle('Device'),
            _buildDeviceItem(
              icon: Icons.bluetooth,
              title: 'Connect',
              subtitle: 'Bluetooth, Wi-Fi',
            ),
            _buildDeviceItem(
              icon: Icons.volume_up,
              title: 'Sound Option',
              subtitle: 'Ring, Silent, Vibrate',
            ),

            // Caretakers Section
            _buildSectionTitle('Caretakers (03)'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  _buildCaretakerAvatar('Dipa Luna'),
                  _buildCaretakerAvatar('Roz Sod.'),
                  _buildCaretakerAvatar('Sunny Tu.'),
                  _buildAddCaretakerButton(),
                ],
              ),
            ),

            // Doctor Section
            _buildSectionTitle('Doctor'),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Add Your Doctor'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ),

            // Additional Options
            _buildAdditionalOption('Privacy Policy'),
            _buildAdditionalOption('Terms of Use'),
            _buildAdditionalOption('Rate Us'),
            _buildAdditionalOption('Share'),

            // Logout Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Log Out'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widgets
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      // trailing: const Icon(Icons.chevron_right),
    );
  }

  Widget _buildDeviceItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(subtitle),
        // trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

  Widget _buildCaretakerAvatar(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/profile.jpg'),
            radius: 25,
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: const TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _buildAddCaretakerButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue[50],
            radius: 25,
            child: const Icon(Icons.add, color: Colors.blue),
          ),
          const SizedBox(height: 4),
          const Text(
            'Add',
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalOption(String title) {
    return ListTile(
      title: Text(title),
      // trailing: Icon(Icons.chevron_right),
    );
  }
}
