import "package:flutter/material.dart";

const baseColor = Color.fromRGBO(254, 110, 110, 1);
const inputHeight = 50.0;

class CommonInput extends StatelessWidget {
  CommonInput({
    Key key,
    this.icon,
    this.text,
    this.maxLines,
    this.onChanged,
    this.type,
  }): super(key: key);
  Icon icon; 
  String text;
  int maxLines;
  Function onChanged;
  String type;

  @override
  Widget build(BuildContext context){
    return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 20.0),
        child: TextField(
          maxLines: maxLines ?? 1,
          style: new TextStyle(fontSize: 20, height: 1, color: Colors.black),
          onChanged: onChanged ?? (){},
          obscureText: type == "password",
        
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: text,
              prefixIcon: icon,
              focusedBorder: OutlineInputBorder(
                  borderSide: new BorderSide(color: baseColor)),
              border: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal))),
        ),
      );
  }
}

class CommonButton extends StatelessWidget{
  CommonButton({
    Key key,
    this.onPressed,
    this.text
  }): super(key: key);
  Function onPressed;
  String text;

  @override
  Widget build(BuildContext context){
    return Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                  height: inputHeight,
                  child: RaisedButton(
                    onPressed: onPressed ?? (){},
                    color: baseColor,
                    child: Text(
                      text,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
            )
          ],
        );
  }
}