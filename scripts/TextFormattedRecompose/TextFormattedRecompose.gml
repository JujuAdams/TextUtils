// Feather disable all

/// @param breakdownArray

function TextFormattedRecompose(_breakdownArray)
{
    static _stringArray = [];
    array_resize(_stringArray, array_length(_breakdownArray));
    
    var _line = 0;
    repeat(array_length(_breakdownArray))
    {
        var _glyphArray = _breakdownArray[_line];
        
        //Remove even-numbered entries (tags)
        var _filteredArray = array_filter(_glyphArray, function(_element, _index)
        {
            return (_index/2 != (_index div 2));
        })
        
        //Remap character codes to chars
        array_map_ext(_filteredArray, function(_element, _index)
        {
            return chr(_element);
        });
        
        //Concatenate chars
        _stringArray[_line] = string_concat_ext(_filteredArray);
        ++_line;
    }
    
    return string_join_ext("\n", _stringArray);
}