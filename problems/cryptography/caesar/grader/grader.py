def grade(arg, key):
    if "FLAG{CaEsaR_Is_EaSy}" in key:
        return True, "Good job!"
    else:
        return False, "Nope, that's not the flag."
