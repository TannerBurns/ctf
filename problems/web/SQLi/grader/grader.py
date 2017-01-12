def grade(arg, key):
    if "FLAG{inj3cti0n_1s_bad_a55}" in key:
        return True, "Good job!"
    else:
        return False, "Oops, try again!"
