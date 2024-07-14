// Feather disable all

/// @param string

function StringSplit_1(_string)
{
    //Empty string
    if (_string == "") return [];
    
    var _firstSplit = string_split(_string, "[");
    
    var _outArray = [];
    
    array_push(_outArray, undefined, _firstSplit[0]);
    
    var _escapeNext = false;
    var _i = 1;
    repeat(array_length(_firstSplit)-1)
    {
        var _substring = _firstSplit[_i];
        
        if (_escapeNext)
        {
            //Previous substring was empty indicating a double [[
            _escapeNext = false;
            array_push(_outArray, undefined, _substring);
        }
        else if (_substring == "")
        {
            //Double [[
            _escapeNext = true;
            array_push(_outArray, undefined, "[");
        }
        else
        {
            var _secondSplit = string_split(_substring, "]", false, 1);
            
            if (array_length(_secondSplit) == 1)
            {
                //No terminator
                array_push(_outArray, undefined, "[", undefined);
                var _postString = _secondSplit[0];
            }
            else
            {
                var _tag = _secondSplit[0];
                var _postString = _secondSplit[1];
                
                array_push(_outArray, _tag);
            }
            
            array_push(_outArray, _postString);
        }
        
        ++_i;
    }
    
    return _outArray;
}