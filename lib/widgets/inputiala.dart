part of 'widgets.dart';

class Inputiala extends StatefulWidget {
  final String label;
  final IconData icon;
  final Function validations;
  final bool isPassword;
  final Function onChanged;

  const Inputiala({
    Key? key,
    title,
    required this.icon,
    required this.label,
    required this.validations,
    this.isPassword = false, required this.onChanged
  }) : super(key: key);

  @override
  _InputialaState createState() => _InputialaState();
}

class _InputialaState extends State<Inputiala> {
  var _focusNode = new FocusNode();

  _focusListener() {
    setState(() {});
  }

  @override
  void initState() {
    _focusNode.addListener(_focusListener);
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_focusListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => this.widget.onChanged(value),
        validator:(value) => this.widget.validations(value), // argumentos de una funcion a la otra
        cursorColor: AppColor.violet,
        autocorrect: false,
        obscureText: this.widget.isPassword,
        focusNode: _focusNode,
        decoration: InputDecoration(
            // focusColor: secondaryColor,
            // hoverColor: secondaryColor,
            // fillColor:  secondaryColor,
            // filled: true,

            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.violet),
            ),
            labelStyle: TextStyle(
                color: AppColor.violet,
                fontFamily: 'Monserrat',
                fontWeight: FontWeight.w200),
            labelText: this.widget.label,
            suffixIcon: Icon(this.widget.icon,
                color: _focusNode.hasFocus ? AppColor.violet : Colors.grey)));
    // focusNode: ,
  }
}
