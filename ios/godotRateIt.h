#ifndef GODOT_RATEIT_H
#define GODOT_RATEIT_H

#include <core/version_generated.gen.h>

#include "core/reference.h"

class GodotRateIt : public Reference {
    
#if VERSION_MAJOR == 3
    GDCLASS(GodotRateIt, Reference);
#else
    OBJ_TYPE(GodotRateIt, Reference);
#endif
    
protected:
    void do_ios_rate(const String &app_id);
    static void _bind_methods();

public:
    
    void ask_and_rate(const String &message, const String &positive_button_text, const String &negative_button_text, const String &app_id);
    
    void rate(const String &url_prefix, const String &url_prefix_fallback, const String &id_format, const String &app_id);

    GodotRateIt();
    ~GodotRateIt();
};

#endif
