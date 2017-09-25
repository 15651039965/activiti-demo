<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!--Start Breadcrumb-->
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="box ui-draggable ui-droppable" id="dept">
				<div class="box-header">
					<div class="box-name">
						<i class="fa fa-coffee"></i> <span>发布任务</span>
					</div>
					<div class="box-icons">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
						</a> <a class="expand-link"> <i class="fa fa-expand"></i>
						</a> <a class="close-link"> <i class="fa fa-times"></i>
						</a>
					</div>
					<div class="no-move"></div>
				</div>
				<div class="box-content">
				
					<form role="form" action="starttask" method="post">			
					<div class="form-group">	
							<label>渠道来源</label> <select name="channel" class="form-control" >
								<option value="1">12315</option>
								<option value="2">12122</option>
								<option value="3">投诉</option>
								<option value="4">交警</option>
							</select>
						</div>
					
					 <div class="form-group">	
							<label>工单类型</label> <select name="tasktype" class="form-control" >
								<option value="1">一般任务</option>
								<option value="2">应急任务</option>
								<option value="3">维修任务</option>
							</select>
						</div>
					
					<!-- 	<div class="form-group has-feedback">
							<label class="control-label">开始时间</label> 
							<input id="start" class="form-control" name="begintime" placeholder="开始时间"><span class="fa fa-calendar txt-danger form-control-feedback"></span>
						</div>
						<div class="form-group has-feedback">
							<label>结束时间</label> <input id="end" class="form-control" name="endtime"
								placeholder="结束时间"><span class="fa fa-calendar txt-danger form-control-feedback"></span>
						</div>
			 <div class="form-group">	
							<label>道路类型</label> <select name="postype" class="form-control" >
								
								<option value="1">城市道路</option>
								<option value="2">城市高架</option>
								<option value="3">快速路</option>
							</select>
						</div>
					
					<div class="form-group">
							<label>施工位置</label> 
							<input type="text" name="roadid">
						</div>

                       <div class="form-group">
							<label>设施类型</label> <select name="style" class="form-control">
								<option value="1">标志</option>
								<option value="2">标杆</option>
								<option value="3">标线</option>
								<option value="4">其他</option>
							</select>
						</div>
						
					<div class="form-group">
							<label>工程类型</label> <select name="type" class="form-control">
								<option value="1">维修</option>
								<option value="2">更换</option>
								<option value="3">新建</option>
								<option value="4">移除</option>
							</select>
						</div>
                                                   任务描述：<input type="text" name="content"><br>
                                                   
                     <div class="form-group">
							<label>附件图片</label> 
							<input type="file" name="file">
						</div>                              
                     <div class="form-group">
							<label>施工单位</label> 
							<input type="text" name="incid">
						</div> 
                       -->
                     
                      <button id="btn" type="button" class="btn btn-primary">发布</button>
					
						
						
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#btn").click(function(){
		$.ajax({
            url:"starttask",
            type:"post",
            data: $("form").serialize(),
            success:function(data){
                alert("发布成功");
                console.log("over..");
            },
            error:function(e){
                alert("错误！！");
                window.clearInterval(timer);
            }
        });        
	
	});
	$('#start').datepicker({setDate: new Date(), dateFormat: 'yy-mm-dd'});
	$('#end').datepicker({setDate: new Date(), dateFormat: 'yy-mm-dd'});
});

</script>

