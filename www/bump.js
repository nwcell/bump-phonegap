 
 
    
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


 
/*
 Receives Data when a bump is match. Check Plugin/ios/Bump.m 
 */
function matchResult(data){
    //alert(data);
    document.getElementById("result").innerHTML = data + '<br>' + document.getElementById("result").innerHTML;
}


/*
 Receives Data like no match, not connected, connected and bump detected 
 Update Bump.m to your liking
 */
function updateContent(data){
     //alert(data);
    document.getElementById("result").innerHTML = data + '<br>' + document.getElementById("result").innerHTML;
}
   
    
