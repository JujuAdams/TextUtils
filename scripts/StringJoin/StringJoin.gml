// Feather disable all

/// @param formatArray

function StringJoin(_array)
{
    //Remove event-numbered entries (tags)
    var _filteredArray = array_filter(_array, function(_element, _index)
    {
        return (_index/2 != (_index div 2));
    })
    
    //Remap character codes to chars
    array_map_ext(_filteredArray, function(_element, _index)
    {
        return chr(_element);
    });
    
    //Concatenate chars
    return string_concat_ext(_filteredArray);
}