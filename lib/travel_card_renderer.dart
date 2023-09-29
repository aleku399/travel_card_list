import 'package:flutter/material.dart';
import 'demo_data.dart';
import 'styles.dart';

class TravelCardRenderer extends StatelessWidget {
    TravelCardRenderer(this.offset, {
        super.key,
        this.cardWidth = 250,
        required this.cardHeight,
        required this.city,
    });

    final double offset;
    final double cardWidth;
    final double cardHeight;
    final City city;

    @override
    Widget build(BuildContext context) {
        return Container(
            width: cardWidth,
            margin: EdgeInsets.only(top: 8),
            child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(
                            top: 30,
                            left: 12,
                            right: 12,
                            bottom: 12,
                        ),
                        decoration: BoxDecoration(
                            color: city.color,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4 * offset.abs(),
                                ),
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10 + 6 * offset.abs(),
                                ),
                            ],
                        ),
                    ),
                    Positioned(
                        top: -15,
                        child: _buildCityImage(),
                    ),
                    _buildCityData(),
                ],
            ),
        );
    }

    Widget _buildCityImage() {
        double maxParallax = 30;
        double globalOffset = offset * maxParallax * 2;
        double cardPadding  = 28;
        double containerWidth = cardWidth - cardPadding;
        return Container(
            height: cardHeight,
            width: containerWidth,
            child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                    _buildPositionedLayer(
                        "images/${city.name}/${city.name}-Back.png",
                        containerWidth * .8,
                        maxParallax * .1,
                        globalOffset,
                    ),
                    _buildPositionedLayer(
                        "images/${city.name}/${city.name}-Middle.png",
                        containerWidth * .9,
                        maxParallax * .6,
                        globalOffset,   
                    ),
                    _buildPositionedLayer(
                        "images/${city.name}/${city.name}-Front.png",
                        containerWidth * .9,
                        maxParallax,
                        globalOffset,
                    ),
                ],
            ),
        );
    }

    Widget _buildCityData() {
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                SizedBox(
                    width: double.infinity,
                    height: cardHeight * .57,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                        city.title,
                        style: Styles.cardTitle,
                        textAlign: TextAlign.center,
                    ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                        city.description,
                        style: Styles.cardSubtitle,
                        textAlign: TextAlign.center,
                    ),
                ),
                Expanded(
                    child: SizedBox(),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        primary: Colors.transparent,
                        backgroundColor: Colors.transparent,
                    ),
                    child: Text(
                        "Learn More".toUpperCase(),
                        style: Styles.cardAction,
                    ),
                    onPressed: null,
                ),
                SizedBox(
                    height: 8,
                ),
            ],
        );
    }

    Widget _buildPositionedLayer(
        String path,
        double width,
        double maxOffset,
        double globalOffset
    ) {
        double cardPadding = 24;
        double layerWidth = cardWidth - cardPadding;
        return Positioned(
            left: ((layerWidth * .5) - (width / 2) - offset * maxOffset) + globalOffset,
            bottom: cardHeight * .45,
            child: Image.asset(
                path,
                width: width,
            ),
        );
    }
}