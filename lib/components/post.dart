import 'package:flutter/material.dart';
import 'package:ii_cpi_project/screens/profileScreen.dart';
import 'package:ii_cpi_project/constantes/constants.dart';

class Post extends StatefulWidget {
  final userId;
  final postID;
  final postingDate;
  final Image image;
  final trajet;
  final Vehicules vehicule;
  final description;
  final postType;
  final date;
  final phoneNumber;
  final time;
  Post(
      {@required this.userId,
      @required this.postID,
      this.description,
      this.image,
      this.date,
        this.time,
      @required this.postingDate,
      @required this.postType,
      this.trajet,
      this.phoneNumber,
      this.vehicule});
  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  final userName = 'Profile name';
  int maxlines = 2;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Expanded(
        child: Container(
          //height: 300,
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: const Offset(
                  1.0,
                  0.9,
                ),
                blurRadius: 4.0,
                spreadRadius: 0.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            border: Border.all(color: Colors.grey),
            color: Colors.black87,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Image.asset('images/logo.png'),
                ),
                title: Text(userName),
                subtitle: Text(widget.postingDate == null
                    ? 'Just now'
                    : widget.postingDate.toString()),
                trailing: DropdownButton(
                  underline: Container(width: 1,),
                  icon: Icon(Icons.more_horiz_rounded),
                  dropdownColor: Colors.blueGrey,
                  items: <String>['Save Post', 'Report Post', 'Notify Me']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      // to transform list<string> to DropDownMenuItem
                      value: value, // the string
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (f) {
                    print(f);
                  },
                ),
                onTap: () {
                  setState(() {
                    Navigator.pushNamed(
                        context, ProfileScreen.id); // go to profile taped in
                  });
                },
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      height: 150,
                     // width: double.infinity,
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textDirection: TextDirection.rtl,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MyOwnContainer(
                                text: widget.vehicule,
                                icon: Icons.train_rounded,
                                subtitle: 'نوع المركبة',
                              ),
                              MyOwnContainer(
                                icon: Icons.phone,
                                text: '0${widget.phoneNumber}',
                                subtitle: 'رقم الهاتف',
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MyOwnContainer(
                                icon: Icons.timer,
                                text: widget.time,
                                subtitle: 'الوقت',
                              ),
                              MyOwnContainer(
                                icon: Icons.timer,
                                text: widget.date,
                                subtitle: 'تاريخ الانطلاق',
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            maxlines == 2 && TextOverflow.values != []
                                ? maxlines = 50
                                : maxlines = 2;
                          });
                        },
                        child: Text(
                          widget.description,
                          style: TextStyle(
                            fontSize: 20
                          ),
                          textDirection: TextDirection.rtl,
                          maxLines: maxlines,
                          overflow: TextOverflow.values == []
                              ? null
                              : TextOverflow.ellipsis,semanticsLabel: 'see more',
                        ),
                      ),
                    ),
                    TrajetContainer(
                      trajet: kWilaya,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyOwnContainer extends StatelessWidget {
  final text;
  final String subtitle;
  final icon;
  MyOwnContainer({this.text, this.icon,this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 26,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                size: 20,
              ),
              Text(text == null
                  ? 'NONE'
                  : text.toString().contains('Vehicules.')
                      ? text.toString().substring(10)
                      : text
                          .toString(),
              style: TextStyle(
                fontSize: 18,
              ),), // if no vehicule selected then print 'NONE'
              //substring to delete the string = 'Vehicules.'
            ],
          ),
          decoration:
              BoxDecoration(
                  color: Colors.black87 ,
                  borderRadius: BorderRadius.circular(9), boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: const Offset(
                1.0,
                2.3,
              ),
              blurRadius: 1.0,
              spreadRadius: 0.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ]),
        ),
        Text(subtitle,style: TextStyle(
          fontSize: 18,
        ),)
      ],
    );
  }
}

class TrajetContainer extends StatelessWidget {
  final List trajet;

  TrajetContainer({this.trajet}) ;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyOwnContainer(
            subtitle: 'نقطة الإنطلاق',
            text: trajet[0],
            icon: Icons.location_on_outlined,
          ),
          Icon(
            Icons.arrow_right_alt,
            size: 40,textDirection: TextDirection.rtl,
          ),
          MyOwnContainer(
            subtitle: 'نقطة الوصول',
            text: trajet.last,
            icon: Icons.location_on_outlined,
          ),
        ],
      ),
    );
  }
}





