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

    function loadmore(datetime){
        $.ajax({
            url: 'demo.php',
            type: 'POST',
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
                var tmpl = $.templates("#projectListTmp");
                var data = {date:getDateEn(date_time), projects:data_list};
                var html = tmpl.render(data);
                $("#project-list").append(html);
                var dd = new Date(datetime.replace(/-/g,"/"));
                var next_date = new Date((dd/1000+86400)*1000);
                var next_date_str = next_date.getFullYear()+"-"+(next_date.getMonth()+1)+"-"+next_date.getDate();
                alert(next_date_str);
                $('#load-more-project').attr('data-date', next_date_str);
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
        loadmore(date);
    })
});