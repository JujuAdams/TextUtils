function TextParseHebrew(_string)
{
    var _glyphArray = TextDecompose(_string);
    __TextBiDiReorder(_glyphArray, true, false);
    return TextRecompose(_glyphArray, false);
}