function fn() {
var env = karate.env;
karate.log('karate.env system property was:', env);
if(!env){
env = 'dev';
}

var config = {
apiUrl: 'https://conduit-api.bondaracademy.com/api/'
}

if(env=='dev'){
 config.userEmail = 'boriszhenya@gmail.com'
 config.userPassword = 'zhenya7503423'
} else if(env == 'qa')
{
 config.userEmail = 'boriszhenya1@gmail.com'
 config.userPassword = 'zhenya456'
}
var accessToken = karate.callSingle('classpath:helpers/CreateToken.feature'.config).authToken
karate.configure('headers',{Authorization:'Token' + accessToken})

return config;
}
