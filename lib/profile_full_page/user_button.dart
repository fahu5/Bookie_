import 'package:flutter/material.dart';

class UserButton extends StatefulWidget {
  const UserButton({super.key});

  @override
  _UserButtonState createState() => _UserButtonState();
}

class _UserButtonState extends State<UserButton> {
  late TextEditingController _usernameController;
  final bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: 'Username');
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: 55,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _isEditing
              ? Container(
               padding: const EdgeInsets.all(8),
                child: TextField(
                 controller: _usernameController,
                 style: const TextStyle(color: Colors.black),
                 decoration: const InputDecoration(
                   hintText: 'Enter username',
                   border: OutlineInputBorder(),
              ),
            ),
          )
              : Text(
            _usernameController.text,
            style: const TextStyle(color: Colors.black),
          ),
        /*  TextButton(
            onPressed: () {
              setState(() {
                if (_isEditing) {
                  // Save the edited username or perform necessary actions
                  _isEditing = false;
                } else {
                  _isEditing = true;
                }
              });
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
            ),
            child: _isEditing
                ? const Text('Save')
                : const Row(
                   children: [
                    Text('Edit'),
                    Icon(Icons.edit, color: Colors.black),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
