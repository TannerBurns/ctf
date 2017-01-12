def grade(arg, key):
    if "FLAG{5}" in key:
        return True, "Correct!"
    else:
        return False, "Incorrect."
