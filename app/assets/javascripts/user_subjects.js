$(document).ready(function(){
    var button = $(".swap_btn");
    var block = $(".inst");
    button.click(function(){
        if(block.is(":visible")){
            block.hide();
            button.text("show");
        }
        else{
            block.show();
            button.text("hide");
        }
    });
});