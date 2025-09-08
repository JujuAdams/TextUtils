// Feather disable all

var _test = testColor;

draw_set_font(fntHebrew);
draw_text(10, 10, _test);
draw_text(10, 110, TextRecompose(TextTransformR2L(TextDecompose(_test))));
draw_text(10, 210, TextFormattedRecompose(TextFormattedTransformR2L(TextFormattedDecompose(_test))));

TextFormattedDraw(
    TextFormattedBuildDraw(
        TextFormattedTransformR2L(
            TextFormattedDecompose(_test),
        ),
        draw_get_font()
    ),
    draw_get_font(),
    10,
    310, 
);