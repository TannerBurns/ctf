def grade(arg, key):
    if "FLAG{Imperator_Iulius_Caesar_Divus}" in key:
        return True, "Good job!"
    else:
        return False, "Oops, try again!"
