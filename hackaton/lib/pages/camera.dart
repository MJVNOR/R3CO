import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:tflite/tflite.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({ Key? key }) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  ImagePicker imagePicker = ImagePicker();
  PickedFile? _image;
  bool _loading = false;
  List<dynamic>? _outputs;


  @override
  void initState() {
    super.initState();
    _loading = true;

    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }

  classifyImage(image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      //Declare List _outputs in the class which will be used to show the classified classs name and confidence
      _outputs = output;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Camera Page'),
      ),

      body: _body(),

      floatingActionButton: FloatingActionButton(
        onPressed: _showImageDialog,
        child: Icon(Icons.image),
      ),

    );
  }

  Widget _body() {

    return _loading ? 
      Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      )
      :
      Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null ? Container() : Image.file(File(_image!.path)),
            SizedBox(height: 20),
            _outputs != null ?
              Text('${_outputs![0]["label"]}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  background: Paint()..color = Colors.white,
                ),
              )
              :
              Container()
          ],
        ),
      );

    // return Padding(
    //   padding: const EdgeInsets.fromLTRB(8.0, 32.0, 8.0, 0),
    //   child: Column(
    //     children: [

    //       Text('Your image'),

    //       SizedBox(height: 16.0),

    //       Container(
    //         width: 400,
    //         height: 400,
    //         padding: EdgeInsets.all(16.0),
    //         alignment: Alignment.center,
    //         child: _image == null ? Image.network('https://i.imgur.com/sUFH1Aq.png') : Image.file(File(_image!.path)),
    //       ),

    //     ],
    //   ),
    // );
  }

  Future<void> _showImageDialog() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                
                _openGalleryButton(),

                SizedBox(height: 8.0),

                _openCameraButton(),

              ],
            ),
          ),
        );
      }
    );
  }

  Widget _openGalleryButton() {
    return TextButton.icon(
      onPressed: () {
        _openGallery();   
      },
      icon: Icon(Icons.picture_in_picture),
      label: Text('Select from gallery'),
    );
  }

  Widget _openCameraButton() {
    return TextButton.icon(
      onPressed: () {
        _openCamera();   
      },
      icon: Icon(Icons.camera_alt),
      label: Text('Open camera'),
    );
  }

  void _openGallery() async {
    var picture = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      Navigator.pop(context);
      _image = picture;
      classifyImage(_image);
    });
  }

  void _openCamera() async {
    var picture = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      Navigator.pop(context);
      _image = picture;
      classifyImage(_image);
    });
  }

}