// Feather disable all

if (keyboard_check_pressed(vk_left))
{
    index = (index - 1 + array_length(testArray)) mod array_length(testArray);
}

if (keyboard_check_pressed(vk_right))
{
    index = (index + 1) mod array_length(testArray);
}
