var BumpApi = {
    
configure: function (success, fail) {
    return cordova.exec(success, fail, "BumpApi", "configure", []);
}
    
};