function TextParseHebrew(_string)
{
    var _glyphArray = TextDecompose(_string);
    array_push(_glyphArray, 0x00);
    TextBiDiReorder(_glyphArray, true, false);
    return TextRecompose(_glyphArray, false);
}