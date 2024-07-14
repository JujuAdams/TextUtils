// Feather disable all

draw_set_font(fntHebrew);
draw_text(10, 10, testNumbers);
draw_text(10, 110, TextRecompose(TextTransformR2L(TextDecompose(testNumbers))));
draw_text(10, 210, TextFormattedRecompose(TextFormattedTransformR2L(TextFormattedDecompose(testNumbers))));