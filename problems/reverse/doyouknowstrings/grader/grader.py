def grade(arg, key):
    if "9447{This_is_a_flag}" in key:
        return True, "Good job!"
    else:
        return False, "Nope, that's not the flag."
