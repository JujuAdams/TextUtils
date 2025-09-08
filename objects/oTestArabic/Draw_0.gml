// Feather disable all

var _test = testSprite;

draw_set_font(fntArabic);
draw_text(10, 10, _test);
draw_text(10, 110, TextRecompose(TextTransformR2L(TextTransformArabic(TextDecompose(_test)))));
draw_text(10, 210, TextFormattedRecompose(TextFormattedTransformR2L(TextFormattedTransformArabic(TextFormattedDecompose(_test)))));

TextFormattedDraw(
    TextFormattedBuildDraw(
        TextFormattedTransformR2L(
            TextFormattedTransformArabic(
                TextFormattedDecompose(_test),
            )
        ),
        draw_get_font()
    ),
    draw_get_font(),
    10,
    310, 
);