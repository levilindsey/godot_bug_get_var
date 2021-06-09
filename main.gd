class_name Main
extends Node2D


var is_running_minimum_bug_repro := true


func _ready() -> void:
    if is_running_minimum_bug_repro:
        # This shows the problem with File.store_var/File.get_var.
        var bug_repro := MinimumBugRepro.new()
        bug_repro.run()
    else:
        # This shows a work-around by overriding _get_property_list().
        var example := PropertyUsageFlagsExample.new()
        example.run()
