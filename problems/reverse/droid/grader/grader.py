def grade(arg, key):
    if "FLAG{flag_wait_wasnt_it_dalvik}" in key:
        return True, "Good job!"
    else:
        return False, "Nope, that's not the flag."
