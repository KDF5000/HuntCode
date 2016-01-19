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

    $('#sub-confirm').on('click', function(event){
        var checked = $('#sub-redio input[name="subRadio"]:checked').val();
        //alert(checked);
        var email = $('#user-email').val();
        //alert(email);
        var Regex = /^(?:\w+\.?)*\w+@(?:\w+\.)*\w+$/;
        if (!Regex.test(email)){
            $("#sub-warning").text("请输入合法的邮箱！");
            return;
        }
        $.ajax({
            url: "/subscribes/",
            type: 'POST',
            dataType: 'json',
            data: {sub_email:email, status:checked},
            success: function (data) {
                var status = data.status;
                if (status == 100) {
                    $("#sub-warning").text(data.msg);
                    return;
                }
            },
            error: function (error) {
                alert('error');
                //$.each(eval("("+error+")"), function(index, el) {
                //    alert(el);
                //});
            }
        });
    });

});