//npm install prompt
var prompt = require('prompt');
var crypto = require('crypto');
var salt = 'mysecretkeys';
var iteration = 16;
var keylength = 16;

prompt.start();

prompt.get(['username', 'password'], function (err, result) {
	if (err) { return onErr(err); }
	//console.log('Username: ' + result.username);
	//console.log('Password: ' + result.password);
	var username = result.username;
	var password = result.password;
	var password2 = 'complexPasswordWhichContainsManyCharactersWithRandomSuffixeghjrjg';
	var hashOfPassword = crypto.pbkdf2Sync(password2, salt, iteration, keylength).toString();
	if (username !== 'boko'){
		console.log('Username is wrong');
		return;
	}
	if (crypto.pbkdf2Sync(password, salt, iteration, keylength).toString() === hashOfPassword) {
		if (password === 'complexPasswordWhichContainsManyCharactersWithRandomSuffixeghjrjg') {
			console.log("You didn't try hard enough");
			return;
		} else {
			console.log("You win the jackpot\n\nThe flag is: FLAG{WuZ_Th4t_uR_1sT_H4SH_C0ll1s10N}");
			return;
		}
	} else {
		console.log('Password is wrong');
		return;
	}
});



function onErr(err) {
    console.log(err);
    return 1;
 }