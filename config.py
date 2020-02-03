
def can_build(plat):
    return plat == "android" or plat=="iphone"

def configure(env):
    if env["platform"] == "android":
        return
        env.android_add_java_dir("android/src")

        env.disable_module()
