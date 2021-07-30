import 'package:flutter/material.dart';


import 'package:hackaton/offer.dart';


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _formKey = GlobalKey<FormState>();

  List<Offer> offers = [

    Offer(
      material: 'Plastic',
      location: 'Fake St. 20',
      amount: '20 lb.',
      description: 'Description 1',
      user: 'User 1',
    ),
    Offer(
      material: 'Metal',
      location: 'Fake St. 1',
      amount: '30 lb.',
      user: 'User 2',
    ),
    Offer(
      material: 'Cardboard',
      location: 'Fake St. 4',
      amount: '15 lb.',
      user: 'User 3',
    ),
    Offer(
      material: 'Glass',
      location: 'Fake St. 5',
      amount: '22 lb.',
      user: 'User 4',
    ),
    Offer(
      material: 'Cardboard',
      location: 'Fake St. 4',
      amount: '15 lb.',
      user: 'User 5',
    ),
    // Offer(
    //   material: 'Cardboard',
    //   location: 'Fake St. 4',
    //   amount: '15 lb.',
    // ),
    // Offer(
    //   material: 'Cardboard',
    //   location: 'Fake St. 4',
    //   amount: '15 lb.',
    // ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Current Offers'),
        centerTitle: true,
        elevation: 0,
      ),

      bottomNavigationBar: _bottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {

          await _showMakeNewOfferDialog(context);

        },
      ),

      body: _body(),

    );
  }

  Widget _body() {

    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 8.0),
      child: Column(

        children: [
          _city(),
          _offers(),
        ],
      ),
    );

  }

  Widget _city() {
    return Center(
      child: TextButton.icon(
        onPressed: () {},
        icon: Icon(Icons.location_city),
        label: Text('City Name'),
      ),
    );
  }

  Widget _bottomNavBar() {
    return BottomAppBar(
      notchMargin: 8.0,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _bottomAction(Icons.person, 'My Offers', '/my_offers'),
          _bottomAction(Icons.check, 'Accepted', '/accepted'),
          SizedBox(width: 32.0),
          _bottomAction(Icons.maps_home_work, 'Map', '/map'),
          _bottomAction(Icons.camera_alt, 'Camera', '/camera'),
        ],
      ),
    );
  }

  Widget _bottomAction(IconData icon, String text, String routeName) {
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        child: Container(
          height: 44.0,
          child: Column(
            children: [
              Icon(icon),
              Text(text),
            ],
          ),
        ),
        onTap: () {Navigator.pushNamed(context, routeName);},
      ),
    );
  }

  Widget _offers() {
    return Expanded(
      child: ListView.builder(
        itemCount: offers.length,
        itemBuilder: (context, index) {
          Offer offer = offers[index];
          return _offerCard(offer);
        },
      ),
    );
  }

  Widget _offerCard(Offer offer) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.all(8.0),
      elevation: 5,

      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(25, 10, 25, 0),
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(offer.material),
                ),
                Expanded(child: SizedBox()),
                IconButton(
                  onPressed: () {
                    setState(() {
                      offers.remove(offer);                      
                    });
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
            isThreeLine: true,
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text('${offer.location} \n${offer.amount} \n${offer.price}'),
                Container(margin: EdgeInsets.only(bottom: 8.0), child: Text('${offer.location}')),
                Container(margin: EdgeInsets.only(bottom: 8.0), child: Text('${offer.amount}')),
                Text('${offer.price}'),
              ],
            ),
            leading: Column(
              children: [
                Icon(Icons.face),
                SizedBox(height: 8.0),
                Text('${offer.user}'),
              ],
            ),
        ),

          TextButton.icon(

            onPressed: () => _showCardDialog(offer),

            icon: Icon(Icons.place_rounded),
            label: Text('More information'),
          ),

        ],
      ),
    );
  }

  Future<void> _showCardDialog(Offer offer) {

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('${offer.material} Offer', style: TextStyle(fontWeight: FontWeight.bold)),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Text('${offer.location} \n${offer.amount} \n${offer.price}'),
            Container(margin: EdgeInsets.only(bottom: 8.0), child: Row(
                children: [Text('Location: ', style: TextStyle(fontWeight: FontWeight.bold)), Text('${offer.location}')],
            )),
            Container(margin: EdgeInsets.only(bottom: 8.0), child: Row(
                children: [Text('Amount: ', style: TextStyle(fontWeight: FontWeight.bold)), Text('${offer.amount}')],
            )),
            Container(margin: EdgeInsets.only(bottom: 8.0), child: Row(
                children: [Text('Price: ', style: TextStyle(fontWeight: FontWeight.bold)), Text('${offer.price}')],
            )),
            SizedBox(height: 8.0),
            Container(margin: EdgeInsets.only(bottom: 8.0), child: Row(
                children: [Text('${offer.description}')],
            )),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                offers.remove(offer);
                Navigator.of(context).pop();             
              });
            },
            child: const Text('Reject'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                offers.remove(offer);
                Navigator.of(context).pop();             
              });
            },
            child: const Text('Accept'),
          ),
        ],
      ),
    );
  }

  Future<void> _showMakeNewOfferDialog(BuildContext context) async {

    String material = '';
    String amount = '';
    String description = '';
    String price = '';


    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Make a new offer'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // ===========================================================================
                TextFormField(
                  validator: (value) => value!.isNotEmpty ? null : 'Invalid field',
                  onSaved: (value) => material = value!,
                  decoration: InputDecoration(hintText: 'Enter some text', labelText: 'Material'),
                ),
                // ===========================================================================
                TextFormField(
                  validator: (value) => value!.isNotEmpty ? null : 'Invalid field',
                  onSaved: (value) => amount = value!,
                  decoration: InputDecoration(hintText: 'Enter some text', labelText: 'Amount'),
                ),
                // ===========================================================================
                TextFormField(
                  onSaved: (value) => description = value!,
                  decoration: InputDecoration(hintText: 'Enter some text', labelText: 'Description (optional)'),
                  maxLines: 3,
                ),
                // ===========================================================================
                TextFormField(
                  decoration: InputDecoration(hintText: 'Enter some text', labelText: 'Price (optional)'),
                  onSaved: (value) => price = (value == null ? 'Free' : value),
                ),
                // ===========================================================================
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/select_location');
                  },
                  icon: Icon(Icons.place_sharp),
                ),

              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  print('Valores: $material, $amount, $description, $price');
                  setState(() {
                    offers.insert(0, Offer(material: material, location: 'Location', 
                                        amount: amount, description: description, 
                                        price: price, user: 'Me'));
                  });
                  Navigator.of(context).pop();
                }
              },
              child: Text('Done', style: TextStyle(fontSize: 16.0)),
            ),
          ],
        );
      }
    );
  }


}