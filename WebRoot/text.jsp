<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title> 
  <link rel="stylesheet" href="http://localhost:7001/arcgisService/arcgis_js_api/library/3.4/3.4/js/dojo/dijit/themes/tundra/tundra.css" type="text/css"></link>
  <link rel="stylesheet" href="http://localhost:7001/arcgisService/arcgis_js_api/library/3.4/3.4/js/esri/css/esri.css" type="text/css"></link>
  <script type="text/javascript"  src="http://localhost:7001/arcgisService/arcgis_js_api/library/3.4/3.4/init.js"></script>
  <style>
      html, body, #map {
        height:100%;
        width:100%;
        margin:0;
        padding:0;
      }
      body {
        background-color:#FFF;
        overflow:hidden;
        font-family:"Trebuchet MS";
      }
          #info {
        top: 20px;
        color: #444;
        height: auto;
        font-family: arial;
        right: 20px;
        margin: 5px;
        padding: 10px;
        position: absolute;
        width: 115px;
        z-index: 40;
        border: solid 2px #ccc;
        border-radius: 4px;
        background-color: #fff;
      }
    </style>
      <script>
      dojo.require("esri.map");

      function init() {
        var map = new esri.Map("map",{
          basemap:"topo",
          center:[-122.45,37.75], //long, lat
          zoom:13,
          sliderStyle:"small"
        });
      }

      dojo.ready(init);
    </script>
    <script>
      dojo.require("esri.map");
      dojo.require("esri.layers.agstiled");
      dojo.require("esri.toolbars.draw");

      var map, tb;

      function init() {

        map = new esri.Map("mapDiv", {
          basemap: "streets",
          center: [-25.312, 34.307],
          zoom: 3
        });
        dojo.connect(map, "onLoad", initToolbar);
      }

      function initToolbar() {
        tb = new esri.toolbars.Draw(map);
        dojo.connect(tb, "onDrawEnd", addGraphic);

        //hook up the button click events 
        dojo.connect(dojo.byId("drawPoint"),"click", function(){
          tb.activate(esri.toolbars.Draw.POINT);
        });

        dojo.connect(dojo.byId("drawMultipoint"),"click", function(){
          tb.activate(esri.toolbars.Draw.MULTI_POINT);
        });

        dojo.connect(dojo.byId("drawExtent"),"click", function(){
          tb.activate(esri.toolbars.Draw.EXTENT);
        });

        dojo.connect(dojo.byId("drawPolyline"),"click", function(){
          tb.activate(esri.toolbars.Draw.POLYLINE);
        });
        dojo.connect(dojo.byId("drawFreehandPolyline"),"click", function(){
          tb.activate(esri.toolbars.Draw.FREEHAND_POLYLINE);
        });
        dojo.connect(dojo.byId("drawPolygon"),"click", function(){
          tb.activate(esri.toolbars.Draw.POLYGON);
        });
        dojo.connect(dojo.byId("drawFreehandPolygon"),"click", function(){
          tb.activate(esri.toolbars.Draw.FREEHAND_POLYGON);
        });
        dojo.connect(dojo.byId("drawLine"),"click", function(){
          tb.activate(esri.toolbars.Draw.LINE);
        });
      }



      function addGraphic(geometry) {
        //deactivate the toolbar and clear existing graphics 
        tb.deactivate(); 
        map.graphics.clear();


        //Marker symbol used for point and multipoint created using svg path. See this site for more examples
        // http://raphaeljs.com/icons/#talkq. You could also create marker symbols using the SimpleMarkerSymbol class
        //to define color, size, style or the PictureMarkerSymbol class to specify an image to use for the symbol. 
        var markerSymbol = new esri.symbol.SimpleMarkerSymbol();
        markerSymbol.setPath("M16,4.938c-7.732,0-14,4.701-14,10.5c0,1.981,0.741,3.833,2.016,5.414L2,25.272l5.613-1.44c2.339,1.316,5.237,2.106,8.387,2.106c7.732,0,14-4.701,14-10.5S23.732,4.938,16,4.938zM16.868,21.375h-1.969v-1.889h1.969V21.375zM16.772,18.094h-1.777l-0.176-8.083h2.113L16.772,18.094z");
        markerSymbol.setColor(new dojo.Color("#00FFFF"));


        //line symbol used for freehand polyline, polyline and line. In this example we'll use a cartographic line symbol
        //Try modifying the cartographic line symbol properties like CAP and JOIN. For CAP try CAP_ROUND or CAP_SQUARE
        //for JOIN try JOIN_BEVEL or JOIN_MITER or JOIN_ROUND
        var lineSymbol = new esri.symbol.CartographicLineSymbol(
          esri.symbol.CartographicLineSymbol.STYLE_SOLID,
          new dojo.Color([255,0,0]), 10, 
          esri.symbol.CartographicLineSymbol.CAP_ROUND,
          esri.symbol.CartographicLineSymbol.JOIN_MITER, 5
        );

        //fill symbol used for extent, polygon and freehand polygon. In this example we use a picture fill symbol
        //the images folder contains additional fill images - try swapping mangrove out for one of the other options
        //(sand, swamp or stiple)
        var fillSymbol = new esri.symbol.PictureFillSymbol("images/mangrove.png",
           new esri.symbol.SimpleLineSymbol(
            esri.symbol.SimpleLineSymbol.STYLE_SOLID,
             new dojo.Color('#000'), 1
            ), 42, 42
        );


        var type = geometry.type, symbol;
        if (type === "point" || type === "multipoint") {
          symbol = markerSymbol;
        }
        else if (type === "line" || type === "polyline") {
          symbol = lineSymbol;
        }
        else {
          symbol = fillSymbol;
        }

      //Add the graphic to the map 
       map.graphics.add(new esri.Graphic(geometry, symbol));
      }

     

      dojo.ready(init);
    </script>
  </head>
  
  <body class="nihilo">

   <!--  <div id="map"></div> -->
    
    <div id="info">
      <div>Select a shape then draw on map to add graphic</div>
      <button id="drawPoint" data-dojo-type="dijit.form.Button">Point</button>
      <button id="drawMultipoint" data-dojo-type="dijit.form.Button">Multipoint</button>
      <button id="drawExtent" data-dojo-type="dijit.form.Button">Extent</button>
      <button id="drawPolyline" data-dojo-type="dijit.form.Button">Polyline</button>
      <button id="drawFreehandPolyline" data-dojo-type="dijit.form.Button">Freehand Polyline</button>
      <button id="drawPolygon" data-dojo-type="dijit.form.Button">Polygon</button>
      <button id="drawFreehandPolygon" data-dojo-type="dijit.form.Button">Freehand Polygon</button>
      <button id="drawLine" data-dojo-type="dijit.form.Button">Line</button>
    </div>

    <div id="mapDiv"></div>
  </body>
</html>
