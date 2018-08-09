#ifndef GODOT_ADMOB_H
#define GODOT_ADMOB_H

#include <version_generated.gen.h>

#include "reference.h"

class GodotRateIt : public Reference {
    
#if VERSION_MAJOR == 3
    GDCLASS(GodotRateIt, Reference);
#else
    OBJ_TYPE(GodotRateIt, Reference);
#endif
    
protected:
    static void _bind_methods();

public:
    
    void ask_and_rate(const String &message, const String &positive_button_text, const String &negative_button_text, const String &app_id);

    GodotRateIt();
    ~GodotRateIt();
};

#endif
