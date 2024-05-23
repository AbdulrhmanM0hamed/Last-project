import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class AiScanning extends StatefulWidget {
  @override
  _AiScanningState createState() => _AiScanningState();
}

class _AiScanningState extends State<AiScanning> {
  File? _image;
  String? _topDisease;
  double? _topProbability;
  bool _isLoading = false;
  Interpreter? _interpreterAllergy;
  Interpreter? _interpreterCancer;
  Interpreter? _interpreterMelanoma;

  final List<String> diseases = [
    "Acne and Rosacea",
    "Eczema and Atopic Dermatitis",
    "Nail Fungus and other Nail Disease",
    "Scabies Lyme Disease and other Infestations and Bites",
    "Actinic Keratoses",
    "Basal Cell Carcinoma",
    "Benign Keratosis like Lesions",
    "Dermatofibroma",
    "Melanocytic Nevi",
    "Vascular Lesions",
    "Melanoma"
  ];

  @override
  void initState() {
    super.initState();
    _loadModels();
  }

  Future<void> _loadModels() async {
    try {
      _interpreterAllergy = await Interpreter.fromAsset(
          'assets/quantized_pruned_model_allergy.tflite');
      _interpreterCancer = await Interpreter.fromAsset(
          'assets/quantized_pruned_model_cancer.tflite');
      _interpreterMelanoma = await Interpreter.fromAsset(
          'assets/quantized_pruned_model_melanoma.tflite');
      print('Models loaded successfully');
    } catch (e) {
      print('Failed to load models: $e');
    }
  }

  Future<void> _getImageFromGallery() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _topDisease = null;
        _topProbability = null;
        _isLoading = true;
        _analyzeImage(_image!);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _analyzeImage(File image) async {
    try {
      final imageBytes = image.readAsBytesSync();
      print('Image loaded successfully, size: ${imageBytes.length}');
      img.Image? oriImage = img.decodeImage(imageBytes);
      if (oriImage == null) {
        throw Exception('Failed to decode image');
      }

      // تحليل الصورة باستخدام النماذج الثلاثة
      Map<String, double> results = {};
      _addResults(results,
          await _analyzeWithModel(oriImage, _interpreterAllergy!, 256, 4), 0);
      _addResults(results,
          await _analyzeWithModel(oriImage, _interpreterCancer!, 128, 6), 4);
      _addResults(results,
          await _analyzeWithModel(oriImage, _interpreterMelanoma!, 250, 1), 10);

      // العثور على المرض ذو النسبة الأعلى
      String topDisease = '';
      double topProbability = 0.0;
      results.forEach((disease, probability) {
        if (probability > topProbability) {
          topDisease = disease;
          topProbability = probability;
        }
      });

      setState(() {
        _isLoading = false;
        _topDisease = topDisease;
        _topProbability = topProbability;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _topDisease = null;
        _topProbability = null;
        print('Error analyzing image: $e');
      });
    }
  }

  void _addResults(
      Map<String, double> results, Map<int, double> modelResults, int offset) {
    modelResults.forEach((key, value) {
      results[diseases[key + offset]] = value;
    });
  }

  Future<Map<int, double>> _analyzeWithModel(img.Image oriImage,
      Interpreter interpreter, int size, int outputSize) async {
    img.Image resizedImage =
        img.copyResize(oriImage, width: size, height: size);
    print('Image resized to $size x $size for model');

    var input = List.generate(
        1,
        (i) => List.generate(
            size, (j) => List.generate(size, (k) => List.filled(3, 0.0))));

    for (var x = 0; x < size; x++) {
      for (var y = 0; y < size; y++) {
        var pixel = resizedImage.getPixel(x, y);
        input[0][x][y][0] = img.getRed(pixel) / 255.0;
        input[0][x][y][1] = img.getGreen(pixel) / 255.0;
        input[0][x][y][2] = img.getBlue(pixel) / 255.0;
      }
    }
    print('Image converted to input format successfully');

    var output = List.filled(outputSize, 0.0).reshape([1, outputSize]);
    print('Output buffer created successfully');

    interpreter.run(input, output);
    print('Model run successfully');

    List<double> results = List<double>.from(output[0]);
    print('Raw results: $results');

    return {for (var i = 0; i < results.length; i++) i: results[i]};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        "AI Scanning",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GestureDetector(
                          onTap: _isLoading ? null : _getImageFromGallery,
                          child: Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: _isLoading
                                ? Container()
                                : (_image != null
                                    ? Image.file(_image!, fit: BoxFit.cover)
                                    : Icon(Icons.image,
                                        size: 100, color: Colors.grey)),
                          ),
                        ),
                        if (_topDisease != null && _topProbability != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 300),
                            child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                'Top Disease: $_topDisease\nProbability: ${(_topProbability! * 100).toStringAsFixed(2)}%',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(100),
                    child: ElevatedButton(
                      onPressed: _isLoading ? null : _getImageFromGallery,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 69, 142, 231),
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child:
                          Text('Select Image', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
              ],
            ),
            if (_isLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
