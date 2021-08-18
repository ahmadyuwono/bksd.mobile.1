import 'package:flutter/material.dart';
import 'package:muba/generated/l10n.dart';
import 'package:muba/model/kontak_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ListviewContact extends StatefulWidget {
  final List<KontakModel> kontakModel;
  const ListviewContact({Key? key, required this.kontakModel})
      : super(key: key);

  @override
  _ListviewContactState createState() => _ListviewContactState();
}

class _ListviewContactState extends State<ListviewContact> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo-kab-muba.png"),
            SizedBox(
              width: 9,
            ),
            Container(
              width: 174,
              height: 42,
              child: Text(
                "BAGIAN KERJASAMA KABUPATEN MUBA",
                style: TextStyle(
                    color: Color(0xFF27405E),
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Center(
          child: Text(
            S.of(context).selectPlatform,
            style: TextStyle(
                color: Color(0xFF27405E),
                fontSize: 18,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 34,
        ),
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: Color(0xFF27405E),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 43),
            child: Column(
              children: [
                Center(
                  child: Text(
                    S.of(context).platformCard,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 28,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      print(widget.kontakModel[0].no_wa.replaceAll("-", ""));
                    });
                    _launchWhatsapp(
                        widget.kontakModel[0].no_wa.replaceAll("-", ""));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/logos_whatsapp.png"),
                      SizedBox(
                        width: 11.88,
                      ),
                      Text(
                        "Whatsapp",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 29,
                ),
                Divider(
                  thickness: 1,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 33,
                ),
                InkWell(
                  onTap: () {
                    _launchEmail(widget.kontakModel[0].email);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/ant-design_mail-filled.png"),
                      SizedBox(
                        width: 10.88,
                      ),
                      Text(
                        "E-Mail",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _launchEmail(String email) async {
    final Uri params = Uri(
        scheme: 'mailto',
        path: '$email',
        query: 'subject=Contact Center&body=From Email');
    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch';
    }
  }

  _launchWhatsapp(String number) async {
    String url = "https://wa.me/$number/?text=";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch';
    }
  }
}
