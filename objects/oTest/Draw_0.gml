// Feather disable all

text = "'twas\n[tag]brillig";

draw_set_font(fntDefault);
draw_text(10, 10, text);
draw_text(10, 110, TextRecompose(TextDecompose(text)));
draw_text(10, 210, TextFormattedRecompose(TextFormattedDecompose(text)));