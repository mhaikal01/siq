import 'package:flutter/material.dart';
import 'package:siq/model/santri.dart';
import 'package:siq/providers/santri_provider.dart';
import 'package:siq/theme.dart';

class NamePage extends StatefulWidget {
  NamePage() : super();

  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  late List<Santri> _santris = [];
  late bool _loading;

  @override
  void initState() {
    super.initState();

    _loading = true;
    SantriProvider.getSantri().then((santris) {
      setState(() {
        _santris = santris;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Center(
          child: Text(_loading ? 'loadding..' : 'Nama Santri'),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/backcopy.jpg'),
              )),
            ),
            ListView.builder(
              padding: EdgeInsets.only(top: 225),
              itemCount: _santris.length,
              itemBuilder: (context, index) {
                Santri santri = _santris[index];
                return Card(
                  child: ListTile(
                    leading: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/user.png'),
                        ),
                      ),
                    ),
                    title: Text(santri.nameSantri!),
                    subtitle: Text(santri.dorm!),
                    trailing: !santri.hadir
                        ? IconButton(
                            icon: Icon(
                              (Icons.done),
                            ),
                            onPressed: () {
                              SantriProvider.postSantri({
                                'id_name': santri.idSantri,
                                'name_santri': santri.nameSantri,
                                'information': 'hadir'
                              }).then((berhasil) {
                                if (berhasil) {
                                  setState(() {
                                    santri.hadir = true;
                                  });
                                }
                              });
                            },
                          )
                        : Container(height: 0, width: 0),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
