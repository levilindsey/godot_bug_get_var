class_name Main
extends Node2D


const PATH := "user://foo.save"


func _ready() -> void:
    store_var()
    get_var()


func store_var() -> void:
    var foo := Foo.new()
    foo.text = "foo"
    
    var file := File.new()
    var status := file.open(PATH, File.WRITE)
    if status != OK:
        push_error("Unable to open file: " + PATH)
        return
    file.store_var(foo, true)
    file.close()


func get_var() -> void:
    var file := File.new()
    var status := file.open(PATH, File.READ)
    if status != OK:
        push_error("Unable to open file: " + PATH)
        return
    var foo = file.get_var(true)
    file.close()
    
    # foo.text is empty.
    print(foo.text)
