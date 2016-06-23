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
//User logged in
app.get('/user',function(req,res,next){
	if(!req.session.username)
		res.redirect('/');
	else{
		db.one("SELECT * FROM users WHERE username='"+req.session.username+"'")
		.then(function(user){
			db.any("SELECT * FROM affixes WHERE a_type='Prefix'")
			.then(function(prefixes){
				db.any("SELECT * FROM affixes WHERE a_type='Suffix'")
				.then(function(suffixes){
					db.any("SELECT * FROM items")
					.then(function(items){
						res.render('user',{username:req.session.username,balance:user.balance,items:items,prefixes:prefixes,suffixes:suffixes});
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
	
});
//Retrive item image
app.get('/user/item',function(req,res,next){
	db.one("SELECT * FROM items WHERE item_name='"+req.query.name+"'")
	.then(function(item){
		res.send(item);
	})
	.catch(function(err){
		console.log(err);
	});
});
//Retrieve a prefix information
app.get('/user/prefix',function(req,res,next){
	db.any("SELECT * FROM affixes WHERE a_type='Prefix' AND name LIKE'%"+req.query.name+"%'")
	.then(function(affix){
		res.send(affix);
	})
	.catch(function(err){
		console.log(err);
	});
});
//Retrieve a suffix information
app.get('/user/suffix',function(req,res,next){
	db.any("SELECT * FROM affixes WHERE a_type='Suffix' AND name LIKE'%"+req.query.name+"%'")
	.then(function(suffix){
		res.send(suffix);
	})
	.catch(function(err){
		console.log(err);
	});
});
//Retrieve all prefixes on log in/refresh
app.get('/user/prefixes',function(req,res,next){
	db.any("SELECT * FROM affixes WHERE a_type='Prefix'")
	.then(function(affixes){
		res.send(affixes);
	})
	.catch(function(err){
		console.log(err);
	});
});
//Retrieve all suffixes on log in/refresh
app.get('/user/suffixes',function(req,res,next){
	db.any("SELECT * FROM affixes WHERE a_type='Suffix'")
	.then(function(suffixes){
		res.send(suffixes);
	})
	.catch(function(err){
		console.log(err);
	});
});

app.listen(3000,function(){
	console.log("POE Shop is listening at 3000");
});