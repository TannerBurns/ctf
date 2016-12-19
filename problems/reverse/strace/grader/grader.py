def grade(arg, key):
    if "TXSTCS{5}" in key:
        return True, "Good job!"
    else:
        return False, "Nope, that's not the flag."
