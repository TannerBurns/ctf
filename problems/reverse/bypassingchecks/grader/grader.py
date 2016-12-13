def grade(arg, key):
    if "FLAG{flag_is_you_know_cracking!!!}" in key:
        return True, "Good job!"
    else:
        return False, "Nope, that's not the flag."
