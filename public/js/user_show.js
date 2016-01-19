/**
 * Created by devin on 1/19/16.
 */
$(function(){
    //$('#user-new-pass-confirm').change(function(event){
    //    var confirm_pass = $(this).val();
    //    var new_pass = $("#user-new-pass").val();
    //    if(confirm_pass != new_pass){
    //        alert('diff');
    //    }
    //});b
    $('#changePassBt').on('click', function(event){
        var confirm_pass = $('#user-new-pass-confirm').val();
        var new_pass = $("#user-new-pass").val();
        var user_old_pass = $("#user-old-pass").val();
        if(user_old_pass == ""){
            $('#input-warning').text('密码不能为空!');
            return;
        }
        if(new_pass.length < 6){
            $('#input-warning').text('密码长度至少为6!');
            return ;
        }
        if(confirm_pass != new_pass){
            //alert('diff');
            $('#input-warning').text('两次密码输入不一致!');
        }else{
            $('#user-pass-edit form').submit();
        }
    });

});