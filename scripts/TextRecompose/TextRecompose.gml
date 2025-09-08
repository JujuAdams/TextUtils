/// @param breakdownArray

function TextRecompose(_breakdownArray)
{
    static _stringArray = [];
    static _glyphArray  = [];
    global.__TextRecompose_glyphArray = _glyphArray;
    
    array_resize(_stringArray, array_length(_breakdownArray));
    
    var _line = 0;
    repeat(array_length(_breakdownArray))
    {
        array_resize(global.__TextRecompose_glyphArray, array_length(_breakdownArray[_line]));
        
        array_foreach(_breakdownArray[_line], function(_element, _index)
        {
            global.__TextRecompose_glyphArray[@ _index] = chr(_element);
        });
        
        _stringArray[@ _line] = string_concat_ext(global.__TextRecompose_glyphArray);
        ++_line;
    }
    
    return string_join_ext("\n", _stringArray);
}