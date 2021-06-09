class_name Bar
extends Object


var text := ""
var children := []


func _get_property_list() -> Array:
    return [
        {
            name = "text",
            type = TYPE_STRING,
            usage = PROPERTY_USAGE_DEFAULT,
        },
        {
            name = "children",
            type = TYPE_ARRAY,
            usage = PROPERTY_USAGE_DEFAULT,
        },
    ]
