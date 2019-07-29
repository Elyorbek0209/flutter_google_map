import 'package:flutter/material.dart';

import 'dart:async';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';




class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();

}





class _HomePageState extends State<HomePage> {


  Completer<GoogleMapController> _controller = Completer();



  @override
  void initState(){

    super.initState();

  }


  double zoomVal = 5.0;



  @override
  Widget build(BuildContext context) {
  
    return Scaffold(

      //----APP BAR - TOP PART of the APP Begins ----

      appBar: AppBar(

        //1st "Return Back" Icon
        leading: IconButton(

          icon: Icon(FontAwesomeIcons.arrowLeft),

          onPressed: (){

            //

          },

        ),


        //2nd 'TITLE' of the App
        title: Text("New York"),


        //3rd "Search" Icon
        actions: <Widget>[

          IconButton(

            icon: Icon(FontAwesomeIcons.search),

            onPressed: (){

              //

            },

          ),

        ],

      ),

      //----END of the APP BAR  ----





      //-----BODY PART of the APP BEGINS ----
      
      body: Stack(

        children: <Widget>[


          _buildGoogleMap(context),

          _zoomminusfunction(),

          _zoomplusfunction(),

          _buildContainer(),


        ],

      ),

      //-----END of the BODY PART of the APP ----
      
    );
  }





  /////////////WIDGETS BEGINS//////////////////
  


  //-----ZOOM IN FUNCTION BEGINS -----

  Widget _zoomminusfunction(){

    return Align(

      alignment: Alignment.topLeft,

      child: IconButton(


        icon: Icon(
          
          FontAwesomeIcons.searchMinus,

          color: Color(0xff6200ee),

        ),


        onPressed: (){

          zoomVal--;

          _minus(zoomVal);

        },

      ),

    );

  }
  //-----END of the ZOOM IN FUNCTION -----



  //-----ZOOM OUT FUNCTION BEGINS -----

  Widget _zoomplusfunction(){

    return Align(

      alignment: Alignment.topRight,

      child: IconButton(


        icon: Icon(
          
          FontAwesomeIcons.searchPlus,

          color: Color(0xff6200ee),

        ),


        onPressed: (){

          zoomVal++;

          _minus(zoomVal);

        },

      ),

    );

  }
  //-----END of the ZOOM OUT FUNCTION -----




  //----"_minus()" FUNCTION BEGINS----

  Future <void> _minus(double zoomVal) async{

    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(
      
      CameraUpdate.newCameraPosition(
        
        CameraPosition(

          target: LatLng(40.712776, -74.005974),

          zoom: zoomVal,

        )

      )

    );

  }

  //----"_minus()" FUNCTION BEGINS----


  //----"_plus()" FUNCTION BEGINS----

  Future <void> _plus(double zoomVal) async{

    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(
      
      CameraUpdate.newCameraPosition(
        
        CameraPosition(

          target: LatLng(40.712776, -74.005974),

          zoom: zoomVal,

        )

      )

    );

  }

  //----"_plus()" FUNCTION BEGINS----







  //----"_buildContainer" Widget BEGINS ----

  Widget _buildContainer(){

    return Align(

      alignment: Alignment.bottomLeft,

      child: Container(

        margin: EdgeInsets.symmetric(vertical: 20.0),

        height: 150.0,


        child: ListView(

          scrollDirection: Axis.horizontal,

          children: <Widget>[


            SizedBox(width: 10.0),

            //1st
            Padding(

              padding: const EdgeInsets.all(8.0),

              child: _boxes(

                "https://lh5.googleusercontent.com/p/AF1QipO3VPL9m-b355xWeg4MXmOQTauFAEkavSluTtJU=w225-h160-k-no",

                40.738380,
                
                -73.988426,
                
                "Gramercy Tavern"
              
              ),

            ),


            SizedBox(width: 10.0),

            //2nd
            Padding(

              padding: const EdgeInsets.all(8.0),

              child: _boxes(

                "https://lh5.googleusercontent.com/p/AF1QipMKRN-1zTYMUVPrH-CcKzfTo6Nai7wdL7D8PMkt=w340-h160-k-no",

                40.761421, 
                
                -73.981667,
                
                "Le Bernardin"
                
              ),

            ),


            SizedBox(width: 10.0),

            //3rd
            Padding(

              padding: EdgeInsets.all(8.0),

              /** Here Declaring Restorant Name,
              * photo & locations below 
              */  
              child: _boxes(

                "https://images.unsplash.com/photo-1504940892017-d23b9053d5d4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                  
                40.732128, 
                  
                -73.999619,
                  
                "Blue Hill"
                  
              ),

            ),


          ],

        ),

      ),

    );

  }

  //----END of the "_buildContainer" Widget ----



  //---- '_boxes()' Widget Begins ----

  Widget _boxes(String _image, double lat, double long, String restaurantName){

    return GestureDetector(

      onTap: (){

        _gotoLocation(lat, long);

      },


      child: Container(

        child: new FittedBox(

          child: Material(


            color: Colors.white,

            elevation: 14.0,

            borderRadius: BorderRadius.circular(24.0),

            shadowColor: Color(0x802196f3),


            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: <Widget>[


                Container(

                  width: 180,

                  height: 200,

                  child: ClipRRect(

                    borderRadius: BorderRadius.circular(24.0),

                    child: Image(

                      fit: BoxFit.fill,

                      image: NetworkImage(_image),

                    ),

                  ),

                ),



                Container(

                  child: Padding(

                    padding: EdgeInsets.all(8.0),

                    child: myDetailsContainer(restaurantName),

                  ),
              
                ),



              ],

            ),

          ),

        ),

      ),

    );

  }




  //----"myDetailsContainer" Widget Begins ------

  Widget myDetailsContainer(String restaurantName){

    return Column(

      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: <Widget>[

        Padding(

          padding: const EdgeInsets.only(left: 8.0),

          child: Container(

            child: Text(restaurantName,

              style: TextStyle(

                color: Color(0xff6200ee),

                fontSize: 24.0,

                fontWeight: FontWeight.bold
                
              ),

            )

          ),

        ),


        SizedBox(height:5.0),


        Container(

          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[


              Container(

                child: Text(

                  "4.1",

                  style: TextStyle(

                    color: Colors.black54,

                    fontSize: 18.0,

                  ),

                )
              
              ),


              Container(

                child: Icon(

                  FontAwesomeIcons.solidStar,

                  color: Colors.amber,

                  size: 15.0,

                ),

              ),


              Container(

                child: Icon(

                  FontAwesomeIcons.solidStar,

                  color: Colors.amber,

                  size: 15.0,

                ),

              ),


              Container(

                child: Icon(

                  FontAwesomeIcons.solidStar,

                  color: Colors.amber,

                  size: 15.0,

                ),

              ),


              Container(

                child: Icon(

                  FontAwesomeIcons.solidStar,

                  color: Colors.amber,

                  size: 15.0,

                ),

              ),


              Container(

                child: Icon(

                  FontAwesomeIcons.solidStarHalf,

                  color: Colors.amber,

                  size: 15.0,

                ),

              ),


              Container(

                child: Text(

                  "(946)",

                  style: TextStyle(

                    color: Colors.black54,
                    
                    fontSize: 18.0,
                
                  ),
             
                )
              
              ),

            ],

          )
          
        ),


        SizedBox(height:5.0),


        Container(

          child: Text(

            "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
               
            style: TextStyle(

              color: Colors.black54,

              fontSize: 18.0,

            ),

          )
          
        ),
             
             
        SizedBox(height:5.0),


        Container(

          child: Text(

            "Closed \u00B7 Opens 17:00 Thu",

            style: TextStyle(

              color: Colors.black54,

              fontSize: 18.0,

              fontWeight: FontWeight.bold
              
            ),

          )
        
        ),



      ],
    
    );

  }
  //----END of "myDetailsContainer" Widget ------






  //-----"_googleMap" Widget BEGINS -----

  Widget _buildGoogleMap(BuildContext context){

    return Container(

      height: MediaQuery.of(context).size.height,

      width: MediaQuery.of(context).size.width,


      child: GoogleMap(

        mapType: MapType.normal,

        /**Here 'initialCameraPositions' 
         * shows the location in google 
        */

        initialCameraPosition: CameraPosition(

          target: LatLng(40.712776, -74.005974),

          zoom: 12,

        ),


        onMapCreated: (GoogleMapController controller){

          _controller.complete(controller);

        },


        markers: {

          newyork1Marker, 
          
          newyork2Marker,

          newyork3Marker,

          gramercyMarker,

          bernardinMarker,

          blueMarker,

        },

      ),

    );

  }

  //-----"_googleMap" Widget BEGINS ----





  //----"_gotoLocation()" Future Begins ------

  Future<void> _gotoLocation(double lat, double long) async{

    final GoogleMapController controller = await _controller.future;


    /**HERE "controller" Animate the CAMERA POSITION
    * to that particular lattitude & longitude value
    */
    controller.animateCamera(
      
      CameraUpdate.newCameraPosition(
        
        CameraPosition(
                

          target: LatLng(lat, long),

          zoom: 15,

          tilt: 50.0,

          bearing: 45.0,
    
        
        )

      )

    );


  }

  //----END of "_gotoLocation()" Future ------


}






//----- 'gramercyMarker' Begins -----

Marker gramercyMarker = Marker(

  markerId: MarkerId('gramercy'),

  position: LatLng(40.738380, -73.988426),

  infoWindow: InfoWindow(title: 'Gramercy Tavern'),

  icon: BitmapDescriptor.defaultMarkerWithHue(

    BitmapDescriptor.hueViolet,

  ),

);


//----- 'bernardinMarker' Begins -----

Marker bernardinMarker = Marker(

  markerId: MarkerId('bernardin'),

  position: LatLng(40.761421, -73.981667),

  infoWindow: InfoWindow(title: 'Le Bernardin'),

  icon: BitmapDescriptor.defaultMarkerWithHue(

    BitmapDescriptor.hueViolet,

  ),

);


//----- 'blueMarker' Begins -----

Marker blueMarker = Marker(

  markerId: MarkerId('bluehill'),

  position: LatLng(40.732128, -73.999619),

  infoWindow: InfoWindow(title: 'Blue Hill'),

  icon: BitmapDescriptor.defaultMarkerWithHue(

    BitmapDescriptor.hueViolet,

  ),

);






  //----- 'LOCATION marker' Begins -----

  //1st place
  Marker newyork1Marker = Marker(

    markerId: MarkerId('newyork1'),

    position: LatLng(40.742451, -74.005959),

    infoWindow: InfoWindow(title: "Los Tacos"),

    icon: BitmapDescriptor.defaultMarkerWithHue(
      
      BitmapDescriptor.hueViolet

    ),

  );



  //2nd place
  Marker newyork2Marker = Marker(

    markerId: MarkerId('newyork2'),

    position: LatLng(40.729640, -73.983510),

    infoWindow: InfoWindow(title: "Nargis"),

    icon: BitmapDescriptor.defaultMarkerWithHue(
      
      BitmapDescriptor.hueViolet

    ),

  );



  //3rd place
  Marker newyork3Marker = Marker(

    markerId: MarkerId('newyork3'),

    position: LatLng(440.719109, -74.000183),

    infoWindow: InfoWindow(title: "Taco Bell"),

    icon: BitmapDescriptor.defaultMarkerWithHue(
      
      BitmapDescriptor.hueViolet

    ),

  );

  //----- End of 'LOCATION marker' -----