def grade(arg, key):
    if "FLAG{maybe_i_shouldn't_have_extracted_everything_huh}" in key:
        return True, "Good job!"
    else:
        return False, "Oops, try again!"
