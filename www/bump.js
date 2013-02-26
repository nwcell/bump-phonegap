 
 
    
window.bump = function(str, callback) {
    cordova.exec(callback, function(err) {
                 callback('');
                 }, "Bump", "bump", [str]);
}; 

window.bumpable = function(str, callback) {
    cordova.exec(callback, function(err) {
                 callback('');
                 }, "Bump", "bumpable", [str]);
}; 


 

function callBack(data){
     alert(data);
}

   
    
