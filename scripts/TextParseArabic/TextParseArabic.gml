// Feather disable all

/// @param string

function TextParseArabic(_string)
{
    static _joinPrevMap = TextGlyphData().arabicJoinPrevMap;
    static _joinNextMap = TextGlyphData().arabicJoinNextMap;
    static _initialMap  = TextGlyphData().arabicInitialMap;
    static _medialMap   = TextGlyphData().arabicMedialMap;
    static _finalMap    = TextGlyphData().arabicFinalMap;
    static _isolatedMap = TextGlyphData().arabicIsolatedMap;
    
    var _glyphArray = TextDecompose(_string);
    array_push(_glyphArray, 0x00);
    
    var _outGlyphArray = [];
    var _prevJoinNext = false;
    
    var _i = 0;
    while(true)
    {
        var _glyphFound = _glyphArray[_i];
        if ((_glyphFound >= 0x0600) && (_glyphFound <= 0x06FF)) // Arabic Unicode block
        {
            var _glyphWrite = _glyphFound;
            var _glyphNext  = _glyphArray[_i+1];
            
            // Lam with Alef ligatures
            if (_glyphWrite == 0x0644)
            {
                if (_glyphNext == 0x0622)
                {
                    _glyphWrite = 0xFEF5; //Lam with Alef with madda above
                }
                else if (_glyphNext == 0x0623)
                {
                    _glyphWrite = 0xFEF7; //Lam with Alef with hamza above
                }
                else if (_glyphNext == 0x0625)
                {
                    _glyphWrite = 0xFEF9; //Lam with Alef with madda below
                }
                else if (_glyphNext == 0x0627)
                {
                    _glyphWrite = 0xFEFB; //Lam with Alef with hamza below
                }
                
                //If we've found a ligature, skip the next glyph
                if (_glyphWrite != _glyphFound)
                {
                    ++_i;
                    _glyphNext = _glyphArray[_i];
                }
            }
            
            // If the next glyph is tashkil, ignore it for the purposes of determining join state
            if ((_glyphNext >= 0x064B) && (_glyphNext <= 0x0652)) //Tashkil range
            {
                var _j = _i;
                do
                {
                    ++_j;
                    _glyphNext = _glyphArray[_j];
                }
                until not ((_glyphNext >= 0x064B) && (_glyphNext <= 0x0652))
            }
            
            // Figure out what to replace this glyph with, depending on what glyphs around it join in which directions
            if (_prevJoinNext) // Does the previous glyph allow joining to us?
            {
                if (_joinPrevMap[? _glyphNext]) // Does the next glyph allow joining to us?
                {
                    array_push(_outGlyphArray, _medialMap[? _glyphWrite] ?? _glyphWrite);
                }
                else
                {
                    array_push(_outGlyphArray, _finalMap[? _glyphWrite] ?? _glyphWrite);
                }
            }
            else
            {
                if (_joinPrevMap[? _glyphNext]) // Does the next glyph allow joining to us?
                {
                    array_push(_outGlyphArray, _initialMap[? _glyphWrite] ?? _glyphWrite);
                }
                else
                {
                    array_push(_outGlyphArray, _isolatedMap[? _glyphWrite] ?? _glyphWrite);
                }
            }
            
            // If this glyph isn't tashkil then update the previous glyph state
            if not ((_glyphFound >= 0x064B) && (_glyphFound <= 0x0652))
            {
                _prevJoinNext = _joinNextMap[? _glyphWrite];
            }
            
            //TODO - Adjust height of shadda after lam
        }
        else if (_glyphFound == 0x00)
        {
            break;
        }
        else
        {
            _prevJoinNext = false;
            array_push(_outGlyphArray, _glyphFound);
        }
        
        ++_i;
    }
    
    __TextBiDiReorder(_outGlyphArray, true, false);
    
    return TextRecompose(_outGlyphArray, false);
}