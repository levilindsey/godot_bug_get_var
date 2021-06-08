class_name Main
extends Node2D


const PATH := "user://foo.save"

var foo_saved := Foo.new()
var foo_loaded


func _ready() -> void:
    foo_saved.text = "foo"
    
    store_var()
    get_var()


func store_var() -> void:
    var file := File.new()
    var status := file.open(PATH, File.WRITE)
    if status != OK:
        push_error("Unable to open file: " + PATH)
        return
    file.store_var(foo_saved, true)
    file.close()


func get_var() -> void:
    var file := File.new()
    var status := file.open(PATH, File.READ)
    if status != OK:
        push_error("Unable to open file: " + PATH)
        return
    foo_loaded = file.get_var(true)
    file.close()
    
    # Prints "Expected: foo; Actual: "
    print("Expected: %s; Actual: %s" % [foo_saved.text, foo_loaded.text])
    # Prints "Expected: Hey; Actual: Hey"
    print("Expected: %s; Actual: %s" %
            [foo_saved.predefined_text, foo_loaded.predefined_text])
