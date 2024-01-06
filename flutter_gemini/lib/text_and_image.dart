import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_gemini/google_gemini.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

const apiKey = "";

class TextWithImage extends StatefulWidget {
  const TextWithImage({
    super.key,
  });

  @override
  State<TextWithImage> createState() => _TextWithImageState();
}

class _TextWithImageState extends State<TextWithImage> {
  bool loading = false;
  List textAndImageChat = [];
  File? imageFile;

  final ImagePicker picker = ImagePicker();

  final TextEditingController _textController = TextEditingController();
  final ScrollController _controller = ScrollController();

  // Create Gemini Instance
  final gemini = GoogleGemini(
    apiKey: apiKey,
  );

  // Text only input
  void fromTextAndImage({required String query, required File image}) {
    setState(() {
      loading = true;
      textAndImageChat.add({
        "role": "User",
        "text": query,
        "image": image,
      });
      _textController.clear();
      imageFile = null;
    });
    scrollToTheEnd();

    gemini.generateFromTextAndImages(query: query, image: image).then((value) {
      setState(() {
        loading = false;
        textAndImageChat
            .add({"role": "Gemini", "text": value.text, "image": ""});
      });
      scrollToTheEnd();
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
        textAndImageChat
            .add({"role": "Gemini", "text": error.toString(), "image": ""});
      });
      scrollToTheEnd();
    });
  }

  void scrollToTheEnd() {
    _controller.jumpTo(_controller.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (textAndImageChat.isEmpty) ...[
            Expanded(
              flex: 10,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: 'Olá!👋',
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          )),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: 'Insira uma Imagem e \nMe faça uma pergunta ',
                        style: GoogleFonts.ubuntu(
                          color: Colors.black,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w200,
                          letterSpacing: 2,
                        ),
                      ),
                      const TextSpan(
                          text: '😄', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
            ),
          ],
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemCount: textAndImageChat.length,
              padding: const EdgeInsets.only(bottom: 20),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      isThreeLine: true,
                      leading: CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 86, 151, 135),
                        child: Text(
                          textAndImageChat[index]["role"].substring(0, 1),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(textAndImageChat[index]["role"]),
                      subtitle: Text(textAndImageChat[index]["text"]),
                      trailing: textAndImageChat[index]["image"] == ""
                          ? null
                          : Image.file(
                              textAndImageChat[index]["image"],
                              width: 90,
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 26),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () async {
                    final XFile? image =
                        await picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      imageFile = image != null ? File(image.path) : null;
                    });
                  },
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      'assets/icons/icon-attachment.png',
                      color: const Color.fromARGB(255, 86, 151, 135),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: TextFormField(
                  controller: _textController,
                  minLines: 1,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14),
                  decoration: InputDecoration(
                      hintText: 'Digite a pergunta',
                      contentPadding:
                          const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      hintStyle: GoogleFonts.ubuntu(
                        color: Colors.black,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 1,
                      ),
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: loading
                            ? const CircularProgressIndicator()
                            : InkWell(
                                onTap: () {
                                  if (imageFile == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Por favor selecione uma imagem")));
                                    return;
                                  }
                                  fromTextAndImage(
                                      query: _textController.text,
                                      image: imageFile!);
                                },
                                child: CircleAvatar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 86, 151, 135),
                                  child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: Image.asset(
                                      'assets/icons/icon-send.png',
                                    ),
                                  ),
                                ),
                              ),
                      )),
                  onChanged: (value) {},
                )),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: imageFile != null
          ? Container(
              margin: const EdgeInsets.only(bottom: 80),
              height: 150,
              child: Image.file(imageFile ?? File("")),
            )
          : null,
    );
  }
}
