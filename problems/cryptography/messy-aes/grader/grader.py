def grade(arg, key):
    if "FLAG{looks_like_you_can_break_aes}" in key:
        return True, "Good job!"
    else:
        return False, "Nope, that's not the flag."
