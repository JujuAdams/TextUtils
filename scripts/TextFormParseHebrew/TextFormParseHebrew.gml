function TextFormParseHebrew(_string)
{
    var _glyphArray = TextFormDecompose(_string);
    __TextFormBiDiReorder(_glyphArray, true, false);
    return TextFormRecompose(_glyphArray);
}