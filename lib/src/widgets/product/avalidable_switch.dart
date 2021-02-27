import 'package:flutter/material.dart';

class AvalidableSwitch extends StatefulWidget {
  bool value;
  Function(bool value) onChanged;
  AvalidableSwitch({this.value, this.onChanged});

  @override
  _AvalidableSwitchState createState() => _AvalidableSwitchState();
}

class _AvalidableSwitchState extends State<AvalidableSwitch> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.value,
      title: Text('Disponible'),
      activeColor: Colors.deepOrange,
      onChanged: (value) {
        widget.onChanged(value);
        setState(() {
          widget.value = value;
        });
      },
    );
  }
}
