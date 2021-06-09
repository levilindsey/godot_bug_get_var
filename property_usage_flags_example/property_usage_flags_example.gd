class_name PropertyUsageFlagsExample
extends Reference
# This shows a work-around by overriding _get_property_list().


const PATH := "user://bar.save"

var bar_saved: Bar
var bar_loaded


func run() -> void:
    set_up_var()
    store_var()
    get_var()
    print_property_usage()


func set_up_var() -> void:
    bar_saved = Bar.new()
    bar_saved.text = "bar"
    
    var child_1 := Bar.new()
    child_1.text = "child_1"
    var child_2 := Bar.new()
    child_2.text = "child_2"
    var child_3 := Bar.new()
    child_3.text = "child_3"
    
    var grandchild_1 := Bar.new()
    grandchild_1.text = "grandchild_1"
    
    bar_saved.children = [child_1, child_2, child_3]
    child_1.children = [grandchild_1]


func store_var() -> void:
    var file := File.new()
    var status := file.open(PATH, File.WRITE)
    if status != OK:
        push_error("Unable to open file: " + PATH)
        return
    file.store_var(bar_saved, true)
    file.close()


func get_var() -> void:
    var file := File.new()
    var status := file.open(PATH, File.READ)
    if status != OK:
        push_error("Unable to open file: " + PATH)
        return
    bar_loaded = file.get_var(true)
    file.close()
    
    # Prints "Expected: bar; Actual: bar"
    print("Expected: %s; Actual: %s" % [
            bar_saved.text,
            bar_loaded.text,
    ])
    # Prints "Expected: 3; Actual: 3"
    print("Expected: %s; Actual: %s" % [
            bar_saved.children.size(),
            bar_loaded.children.size(),
    ])
    # Prints "Expected: grandchild_1; Actual: grandchild_1"
    print("Expected: %s; Actual: %s" % [
            bar_saved.children[0].children[0].text,
            bar_loaded.children[0].children[0].text,
    ])


func print_property_usage() -> void:
    print("Bar property usage:")
    for property in bar_saved.get_property_list():
        prints("   ", property.name, property.usage)
