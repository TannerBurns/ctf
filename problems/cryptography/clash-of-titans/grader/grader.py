def grade(arg, key):
    if "FLAG{WuZ_Th4t_uR_1sT_H4SH_C0ll1s10N}" in key:
        return True, "Good job!"
    else:
        return False, "Nope, that's not the flag."
