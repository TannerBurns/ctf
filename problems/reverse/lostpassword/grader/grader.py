def grade(arg, key):
    if "FLAG{his_is_a_gift}" in key:
        return True, "Good job!"
    else:
        return False, "Nope, that's not the flag."
