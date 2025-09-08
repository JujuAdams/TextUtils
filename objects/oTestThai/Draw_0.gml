// Feather disable all

var _test = testString;

draw_set_font(fntThai);
draw_text(10, 10, _test);
draw_text(10, 110, TextRecompose(TextTransformThai(TextDecompose(_test))));
draw_text(10, 210, TextFormattedRecompose(TextFormattedTransformThai(TextFormattedDecompose(_test))));

TextFormattedDraw(
    TextFormattedBuildDraw(
        TextFormattedTransformThai(
            TextFormattedDecompose(_test),
        ),
        draw_get_font()
    ),
    draw_get_font(),
    10,
    310, 
);