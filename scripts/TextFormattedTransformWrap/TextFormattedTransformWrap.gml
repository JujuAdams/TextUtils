// Feather disable all

/// @param breakdownArray
/// @param font
/// @param width
/// @param perChar

function TextFormattedTransformWrap(_breakdownArray, _font, _limitWidth, _perChar)
{
    static _bidiMap = TextGlyphData().bidiMap;
    
    var _glyphDataMap = TextUtilsCacheFontInfo(_font).fastGlyphs;
    
    var _line = 0;
    repeat(array_length(_breakdownArray))
    {
        //Remove a line of glyphs from the breakdown array
        var _glyphArray = _breakdownArray[_line];
        array_delete(_breakdownArray, _line, 1);
        
        //Insert a new line
        var _lineArray = [];
        array_insert(_breakdownArray, _line, _lineArray);
        ++_line;
        
        var _tagStack = undefined;
        var _x = 0;
        var _i = 0;
        
        if (not _perChar)
        {
            var _wordStart = 0;
            var _inWhitespace = false;
            
            repeat(array_length(_glyphArray) div 2)
            {
                var _foundTagArray = _glyphArray[_i];
                var _code          = _glyphArray[_i+1];
                
                var _glyphData = _glyphDataMap[? _code];
                
                if ((_bidiMap[? _code] ?? BIDI.L2R) == BIDI.WHITESPACE)
                {
                    if (not _inWhitespace)
                    {
                        _inWhitespace = true;
                        
                        //We've moved from a word into whitespace
                        //We need to figure out how big the word was and place it onto the correct line
                        var _wordLength = _i - _wordStart;
                        if (_wordLength > 0)
                        {
                            var _wordShift = 0;
                            var _wordWidth = 0;
                            
                            var _j = _wordStart + 1;
                            repeat((_wordLength div 2)-1)
                            {
                                _wordWidth += _glyphDataMap[? _glyphArray[_j]].shift;
                                _j += 2;
                            }
                            
                            _wordShift = _wordWidth;
                            _wordShift += _glyphDataMap[? _glyphArray[_j]].shift;
                            
                            _wordWidth += _glyphDataMap[? _glyphArray[_j]].w;
                            
                            //If the word is bigger than we have space for, start a new line
                            //However, we don't want to start a new line if nothing else already on this line
                            if ((_x > 0) && (_x + _wordWidth > _limitWidth))
                            {
                                //Terminator
                                array_push(_lineArray, undefined, 0x00);
                                
                                //Push a line to our breakdown array
                                var _lineArray = [];
                                array_insert(_breakdownArray, _line, _lineArray);
                                ++_line;
                                
                                _x = 0;
                            }
                            
                            array_copy(_lineArray, array_length(_lineArray), _glyphArray, _wordStart, _wordLength);
                            
                            //Pop the tag stack (if we have one)
                            if (_tagStack != undefined)
                            {
                                var _index = array_length(_lineArray) - _wordLength;
                                
                                var _startTagArray = _lineArray[_index];
                                if (_startTagArray != undefined)
                                {
                                    array_copy(_tagStack, array_length(_tagStack), _startTagArray, 0, array_length(_startTagArray));
                                }
                                
                                _lineArray[@ _index] = _tagStack;
                                
                                _tagStack = undefined;
                            }
                            
                            _x += _wordShift;
                        }
                        
                        if (_code == 0) break;
                    }
                    
                    //Only push whitespace if it fits inside the limits
                    //But don't push whitespace if we're at the start of a line
                    if ((_x > 0) && (_x + _glyphData.shift <= _limitWidth))
                    {
                        array_push(_lineArray, _foundTagArray, _code);
                        _x += _glyphData.shift;
                    }
                    else
                    {
                        //We're not going to push this character which might cause problems if that character has tags
                        //We push all tags for this glyph onto a stack which is popped for the next glyph that gets rendered
                        if (_foundTagArray != undefined)
                        {
                            if (_tagStack == undefined) _tagStack = [];
                            array_copy(_tagStack, array_length(_tagStack), _foundTagArray, 0, array_length(_foundTagArray));
                        }
                    }
                }
                else
                {
                    if (_inWhitespace)
                    {
                        _inWhitespace = false;
                        
                        //Entered into a new word from whitespace
                        _wordStart = _i;
                    }
                }
                
                _i += 2;
            }
        }
        else
        {
            repeat((array_length(_glyphArray) div 2)-1)
            {
                var _foundTagArray = _glyphArray[_i];
                var _code          = _glyphArray[_i+1];
                
                var _glyphData = _glyphDataMap[? _code];
                
                //If this glyph is too wide for the line, push it to the next line
                if ((_x > 0) && (_x + _glyphData.w > _limitWidth))
                {
                    //Terminator
                    array_push(_lineArray, undefined, 0x00);
                    
                    //Push a line to our breakdown array
                    var _lineArray = [];
                    array_insert(_breakdownArray, _line, _lineArray);
                    ++_line;
                    
                    _x = 0;
                }
                
                //Only push this glyph to the line if it's not whitespace, or if we're in the middle of the line
                if (((_bidiMap[? _code] ?? BIDI.L2R) != BIDI.WHITESPACE) || ((_x > 0) && (_x + _glyphData.w <= _limitWidth)))
                {
                    //Pop the tag stack (if we have one)
                    if (_tagStack == undefined)
                    {
                        array_push(_lineArray, _foundTagArray, _code);
                    }
                    else
                    {
                        array_copy(_tagStack, array_length(_tagStack), _foundTagArray, 0, array_length(_foundTagArray));
                        array_push(_lineArray, _tagStack, _code);
                        _tagStack = undefined;
                    }
                }
                else
                {
                    //We're not going to push this character which might cause problems if that character has tags
                    //We push all tags for this glyph onto a stack which is popped for the next glyph that gets rendered
                    if (_foundTagArray != undefined)
                    {
                        if (_tagStack == undefined) _tagStack = [];
                        array_copy(_tagStack, array_length(_tagStack), _foundTagArray, 0, array_length(_foundTagArray));
                    }
                }
                
                _x += _glyphData.shift;
                _i += 2;
            }
        }
        
        //Terminator
        array_push(_lineArray, _tagStack, 0x00);
    }
    
    return _breakdownArray;
}