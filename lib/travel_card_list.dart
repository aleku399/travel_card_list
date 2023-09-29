import 'package:flutter/material.dart';
import 'travel_card_renderer.dart';
import 'demo_data.dart';

class TravelCardList extends StatelessWidget {
    TravelCardList({Key? key, required this.cities});

    final List<City> cities;
    double _cardHeight = 200;
    double _cardWidth = 160;
    double _normalizedOffset = 0;

    @override
    Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;
        _cardHeight = (size.height * .48).clamp(300.0, 400.0);
        _cardWidth = _cardHeight * .8;
        
        final _pageController = PageController(
            initialPage: 1,
        );

        return Container(
            height: _cardHeight,
            child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                itemCount: 8,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i) => _buildItemRenderer(i), 
            ),
        );
    }
    
    Widget _buildItemRenderer(int indexItem) {
        return Container(
            child: TravelCardRenderer(
                _normalizedOffset,
                city: cities[indexItem % cities.length],
                cardWidth: _cardWidth,
                cardHeight: _cardHeight,
            ),
        );
    }
}