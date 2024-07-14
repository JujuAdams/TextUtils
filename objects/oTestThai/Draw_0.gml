// Feather disable all

draw_set_font(fntThai);
draw_text(10, 10, testString);
draw_text(10, 110, TextRecompose(TextTransformThai(TextDecompose(testString))));
draw_text(10, 210, TextFormattedRecompose(TextFormattedTransformThai(TextFormattedDecompose(testString))));