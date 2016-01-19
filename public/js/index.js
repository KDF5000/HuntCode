/**
 * Created by devin on 1/11/16.
 */
$(function(){

    var dateEn = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP','OCT', 'NOV', 'DEC'];
    function getDateEn(datetime){
        //2013-12-12
        var index = datetime.substr(5,2);
        // alert(dateEn[parseInt(index)-1]);
        return dateEn[parseInt(index)-1] + " " +datetime.substr(8,2);
    }
    var first_load = true
    var click_up = function(){
        var projectId = $(this).attr('data-pid');
        var upNumDom =  $(this).find('span.up_num');
        var currNum = $(this).find('span.up_num').text();
        //$(this).find('span.up_num').text(parseInt(currNum)+1);
        $.ajax({
            url: "/projects/"+projectId+"/stars/",
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                var status = data.status;
                if (status != 100) {
                    alert(data.msg);
                    return;
                }
                upNumDom.text(parseInt(currNum)+1)
            },
            error: function (error) {
                alert('error');
                //$.each(eval("("+error+")"), function(index, el) {
                //    alert(el);
                //});
            }
        });
    }

    function loadmore(datetime){
        $.ajax({
            url: '/projects/date/'+datetime,
            type: 'get',
            dataType: 'json',
            data: {id: '1'},
            success: function(data){
                var status = data.status;
                if(status != 100){
                    alert('failed');
                    return;
                }
                var date_time = data.date
                var data_list = data.data;
                if(data_list.length ==0){
                    //alert("没有更多数据了");
                    $('.load_pre_date').find('h3').text('没有更多数据了');
                    $("#load-more-project").unbind(); //不能点击
                    return;
                }
                var tmpl = $.templates("#projectListTmp");
                var data = {date:getDateEn(datetime), projects:data_list};
                var html = tmpl.render(data);
                $("#project-list").append(html);
                //var dd = new Date(datetime.replace(/-/g,"/"));
                //var next_date = new Date((dd/1000-86400)*1000);
                //var next_date_str = next_date.getFullYear()+"-"+(next_date.getMonth()+1)+"-"+next_date.getDate();
                //alert(next_date_str);
                $('#load-more-project').attr('data-date', date_time);
                if(first_load){
                    $("#load-more-project").click();
                    first_load = false;
                }
            },
            error: function(error){
                alert('error');
                // $.each(eval("("+error+")"), function(index, el) {
                //     alert(el);
                // });
            }
        })
        
    }

    $("#load-more-project").click(function(event){
        //var lastChild = $("#project-list:last-child").text('');
        var date = $(this).attr('data-date');
        if (date == ''){
            $('.load_pre_date').find('h3').text('没有更多数据了');
            $("#load-more-project").unbind(); //不能点击
            return;
        }
        //alert(date);
        loadmore(date);
    });
    $("#load-more-project").click();
    // 点赞
    $('body').on('click','.up_bt' ,click_up);

    $('#sub-confirm').on('click', function(event){
        var email = $('#sub-email').val();
        //alert(email);
        var Regex = /^(?:\w+\.?)*\w+@(?:\w+\.)*\w+$/;
        if (!Regex.test(email)){
            alert("请输入合法的邮箱！");
            return;
        }
        $.ajax({
            url: "/subscribes/",
            type: 'POST',
            dataType: 'json',
            data: {sub_email:email, status:1},
            success: function (data) {
                var status = data.status;
                if (status == 100) {
                    alert(data.msg);
                    $('#sub-email').val('');
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