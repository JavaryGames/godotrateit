
def can_build(plat):
    return plat == "android" or plat=="iphone"

def configure(env):
    if env["platform"] == "android":
        env.disable_module()
        return
        env.android_add_java_dir("android/src")

