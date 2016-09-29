def grade(arg, key):
    if "FLAG{md5_i5_w34k}" in key:
        return True, "Good job!"
    else:
        return False, "Nope, that's not the flag."
