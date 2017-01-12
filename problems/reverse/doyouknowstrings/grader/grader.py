def grade(arg, key):
    if "FLAG{This_is_a_flag}" in key:
        return True, "Good job!"
    else:
        return False, "Nope, that's not the flag."
