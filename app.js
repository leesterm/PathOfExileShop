var express = require('express');
var app = express();

//setup handlebars
app.set('views','views');
app.set('view engine','hbs')

//user scripts/css files
app.use(express.static('public'));

//setup postgres
var promise = require('bluebird');
var options = {promiseLib:promise};
var pgp = require('pg-promise')(options);
var db = pgp('postgres://postgres:password@localhost:5432/pathofexile');

//setup body-parser for POST requests
var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:false}));

//setup sessions+cookies
var session = require('express-session');
app.use(session({
	name:'user_login',
	secret:'safe',
	saveUninitialized:'true',
}))

//ROUTES
//Main page, Checks if user is logged in already
app.get('/',function(req,res,next){
	if(req.session.username)
		res.redirect('/user');
	else
		res.render('index');
});
//Logging in
app.post('/',function(req,res,next){
	db.one("SELECT * from users where username='"+req.body.username+"'AND password='"+req.body.password+"';")
	.then(function(data){
		req.session.username = data.username;
		res.redirect('/user/');
	})
	.catch(function(err){
		res.render('index',{error:'Incorrect username or password'});
	});
});
//User logged in, Get user information, prefix and suffix information, and bases information
app.get('/user',function(req,res,next){
	if(!req.session.username)
		res.redirect('/');
	else{
		db.one("SELECT * FROM users WHERE username='"+req.session.username+"'")
		.then(function(user){
			db.any("SELECT * FROM affixes WHERE a_type='Prefix' AND chests = true")
			.then(function(prefixes){
				db.any("SELECT * FROM affixes WHERE a_type='Suffix' AND chests = true")
				.then(function(suffixes){
					db.any("SELECT * FROM bases")
					.then(function(bases){
						db.any("SELECT * FROM binding,bases WHERE binding.base_id = bases.id AND username='"+req.session.username+"'")
						.then(function(items){
							//console.log(items);
							res.render('user',{username:req.session.username,balance:user.balance,bases:bases,prefixes:prefixes,suffixes:suffixes,items:items});
						})
					})
				})
			})
		})
	}
});
//User log out
app.get('/user/logout',function(req,res,next){
	req.session.destroy(function(){
		res.redirect('/');
	})
});
//Creating User
app.post('/register/user',function(req,res,next){
	db.none("INSERT INTO users(username,password) VALUES ('"+req.body.user+"','"+req.body.pw+"')")
	.then(function(data){
		res.redirect('/');
	})
	.catch(function(err){
		console.log(err);
	});
});
//Sell item
app.post('/user/sell',function(req,res,next){
	db.one("SELECT * FROM bases WHERE item_name ='"+req.body.item+"'")
	.then(function(base){
		db.one("INSERT INTO binding(base_id,username,status,cost) VALUES ("+base.id+",'"+req.session.username+"','selling',"+parseFloat(req.body.cost)+") RETURNING bind_id").
		then(function(bind){
			console.log(bind);
			if(req.body.prefix1){
				db.any("SELECT * FROM affixes WHERE a_type = 'Prefix' AND name LIKE '%"+req.body.prefix1+"%'")
				.then(function(pref1){
					db.none("INSERT INTO set_of_affixes(bind_id,affix_id) VALUES ("+bind.bind_id+","+pref1[0].id+")")
				})
			}
			if(req.body.prefix2){
				db.any("SELECT * FROM affixes WHERE a_type = 'Prefix' AND name LIKE '%"+req.body.prefix2+"%'")
				.then(function(pref2){
					db.none("INSERT INTO set_of_affixes(bind_id,affix_id) VALUES ("+bind.bind_id+","+pref2[0].id+")")
				})
			}
			if(req.body.prefix3){
				db.any("SELECT * FROM affixes WHERE a_type = 'Prefix' AND name LIKE '%"+req.body.prefix3+"%'")
				.then(function(pref3){
					db.none("INSERT INTO set_of_affixes(bind_id,affix_id) VALUES ("+bind.bind_id+","+pref3[0].id+")")
				})
			}
			if(req.body.suffix1){
				db.any("SELECT * FROM affixes WHERE a_type = 'Suffix' AND name LIKE '%"+req.body.suffix1+"%'")
				.then(function(suff1){
					db.none("INSERT INTO set_of_affixes(bind_id,affix_id) VALUES ("+bind.bind_id+","+suff1[0].id+")")
				})
			}
			if(req.body.suffix2){
				db.any("SELECT * FROM affixes WHERE a_type = 'Suffix' AND name LIKE '%"+req.body.suffix2+"%'")
				.then(function(suff2){
					db.none("INSERT INTO set_of_affixes(bind_id,affix_id) VALUES ("+bind.bind_id+","+suff2[0].id+")")
				})
			}
			if(req.body.suffix3){
				db.any("SELECT * FROM affixes WHERE a_type = 'Suffix' AND name LIKE '%"+req.body.suffix3+"%'")
				.then(function(suff3){
					db.none("INSERT INTO set_of_affixes(bind_id,affix_id) VALUES ("+bind.bind_id+","+suff3[0].id+")")
				})
			}
			res.redirect("/user");
		})
	});
});
//Retrieve item image
app.get('/user/item',function(req,res,next){
	db.one("SELECT * FROM bases WHERE item_name='"+req.query.name+"'")
	.then(function(item){
		res.send(item);
	})
	.catch(function(err){
		console.log(err);
	});
});
//Retrieve a prefix information
app.get('/user/prefix',function(req,res,next){
	db.any("SELECT * FROM affixes WHERE a_type='Prefix' AND name LIKE'%"+req.query.name+"%' AND chests = true")
	.then(function(affix){
		res.send(affix);
	})
	.catch(function(err){
		console.log(err);
	});
});
//Retrieve a suffix information
app.get('/user/suffix',function(req,res,next){
	db.any("SELECT * FROM affixes WHERE a_type='Suffix' AND name LIKE'%"+req.query.name+"%' AND chests = true")
	.then(function(suffix){
		res.send(suffix);
	})
	.catch(function(err){
		console.log(err);
	});
});
//Retrieve all prefixes on add new prefix
app.get('/user/prefixes',function(req,res,next){
	db.any("SELECT * FROM affixes WHERE a_type='Prefix' AND chests = true")
	.then(function(affixes){
		res.send(affixes);
	})
	.catch(function(err){
		console.log(err);
	});
});
//Retrieve all suffixes on add new suffix
app.get('/user/suffixes',function(req,res,next){
	db.any("SELECT * FROM affixes WHERE a_type='Suffix' AND chests = true")
	.then(function(suffixes){
		res.send(suffixes);
	})
	.catch(function(err){
		console.log(err);
	});
});
//View the information of an item 
app.get('/user/item_info',function(req,res,next){
	console.log(req.query.bind_id);
	db.any("SELECT * FROM binding,bases,set_of_affixes,affixes WHERE affixes.id = set_of_affixes.affix_id AND binding.bind_id = set_of_affixes.bind_id AND binding.base_id = bases.id AND binding.bind_id="+req.query.bind_id)
	.then(function(item){
		console.log(item);
		res.render("item_info",{item:item});
	})
	.catch(function(err){
		console.log(err);
	})
});


app.listen(3000,function(){
	console.log("POE Shop is listening at 3000");
});
