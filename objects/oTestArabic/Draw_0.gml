// Feather disable all

draw_set_font(fntArabic);
draw_text(10, 10, testTashkil);
draw_text(10, 110, TextRecompose(TextTransformR2L(TextTransformArabic(TextDecompose(testTashkil)))));
draw_text(10, 210, TextFormattedTransformArabic(testTashkil));