 
 
//when called initializes Bump
//check index.html on how to use
window.bump = function(str, callback) {
    cordova.exec(callback, function(err) {
                 callback('');
                 }, "Bump", "bump", [str]);
}; 

//Turns Bump YES or NO
//check index.html on how to use
window.bumpable = function(str, callback) {
    cordova.exec(callback, function(err) {
                 callback('');
                 }, "Bump", "bumpable", [str]);
}; 


 
/*
 Receives Data when a bump is match. Data received is the user_id of the other user.
 Check Plugin/Bump.m 
 */
function matchResult(data){
    //alert(data);
    
    document.getElementById("result").innerHTML = 'Bumped with User_id +'data + '<br>' + document.getElementById("result").innerHTML;
}


/*
 Receives Data like BUMP-DETECTED, NO-MATCH, CONNECTED, DISCONNECTED 
 Update Bump.m to your liking
 */
function updateContent(data){
     //alert(data);
    document.getElementById("result").innerHTML = data + '<br>' + document.getElementById("result").innerHTML;
}
   
    
