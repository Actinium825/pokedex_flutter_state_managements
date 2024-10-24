import 'package:flutter/material.dart';

const morePokemonCount = 20;

// Pokemon List Page
const pokemonTypeNamePadding = EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0);
const pokemonTypeNameMargin = EdgeInsets.only(bottom: 4.0, right: 8.0);
const pokemonCardSize = 80.0;
const pokemonCardPadding = EdgeInsets.all(8.0);
const pokemonNamePadding = EdgeInsets.symmetric(vertical: 8.0);
const pokemonListPageFooterHeight = 100.0;
const pokemonGridDelegate = SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 250, childAspectRatio: 3 / 2);
const pokemonListPagePadding = EdgeInsets.symmetric(horizontal: 12.0);
const progressIndicatorFooterPadding = EdgeInsets.all(12.0);
const debouncerDelayInMilliseconds = 300;

// Pokemon Info Page

const infoPageHeaderPadding = EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0);
const idNumberPadWidth = 3;
const infoPageImageSize = 200.0;
const lightnessAddition = 0.1;
const typeNameRadius = 20.0;
