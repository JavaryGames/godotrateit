#include <core/version_generated.gen.h>

#if VERSION_MAJOR == 3
#include <core/class_db.h>
#include <core/engine.h>
#else
#include "core/class_db.h"
#include "core/globals.h"
#endif

#include "register_types.h"
#include "ios/godotRateIt.h"

void register_godotrateit_types() {
#if VERSION_MAJOR == 3
    Engine::get_singleton()->add_singleton(Engine::Singleton("GodotRateIt", memnew(GodotRateIt)));
#else
    Globals::get_singleton()->add_singleton(Globals::Singleton("GodotRateIt", memnew(GodotRateIt)));
#endif
}

void unregister_godotrateit_types() {
}
