def grade(arg, key):
    if "FLAG{this_is_a_simple}" in key:
        return True, "Good job!"
    else:
        return False, "Oops, try again!"
