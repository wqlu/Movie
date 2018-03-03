<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="itemAddForm" class="itemForm" method="post">
	    <table cellpadding="5">
	        <%--<tr>--%>
	            <%--<td>商品类目:</td>--%>
	            <%--<td>--%>
	            	<%--<a href="javascript:void(0)" class="easyui-linkbutton selectItemCat">选择类目</a>--%>
	            	<%--<input type="hidden" name="cid" style="width: 280px;"></input>--%>
	            <%--</td>--%>
	        <%--</tr>--%>
			<tr>
				<td>电影名称:</td>
				<td><input class="easyui-textbox" name="moviename" data-options="required:true,multiline:true,validType:'length[0,150]'" style="height:60px;width: 280px;"></input></td>
			</tr>

			<tr>
				<td>上映年份:</td>
				<td><input class="easyui-datebox" name="showyear"></input></td>
				<%--<script type="text/javascript">--%>
                    <%--function myformatter(date){--%>
                        <%--var y = date.getFullYear();--%>
                        <%--var m = date.getMonth()+1;--%>
                        <%--var d = date.getDate();--%>
                        <%--return y+'-'+(m<10?('0'+m):m)+'-'+(d<10?('0'+d):d);--%>
                    <%--}--%>
                    <%--function myparser(s){--%>
                        <%--if (!s) return new Date();--%>
                        <%--var ss = (s.split('-'));--%>
                        <%--var y = parseInt(ss[0],10);--%>
                        <%--var m = parseInt(ss[1],10);--%>
                        <%--var d = parseInt(ss[2],10);--%>
                        <%--if (!isNaN(y) && !isNaN(m) && !isNaN(d)){--%>
                            <%--return new Date(y,m-1,d);--%>
                        <%--} else {--%>
                            <%--return new Date();--%>
                        <%--}--%>
                    <%--}--%>
				<%--</script>--%>
			</tr>

			<tr>
				<td>国家/地区:</td>
				<td><input class="easyui-textbox" name="nation" data-options="required:true,mmultiline:true,validType:'length[0,150]'" style="height:60px;width: 280px;"></input></td>
			</tr>

			<tr>
				<td>导演:</td>
				<td><input class="easyui-textbox" name="director" data-options="required:true,mmultiline:true,validType:'length[0,150]'" style="height:60px;width: 280px;"></input></td>
			</tr>

			<tr>
				<td>主演:</td>
				<td><input class="easyui-textbox" name="leadactors" data-options="required:true,mmultiline:true,validType:'length[0,150]'" style="height:60px;width: 280px;"></input></td>
			</tr>

			<tr>
				<td>编剧:</td>
				<td><input class="easyui-textbox" name="screenwriter" data-options="required:true,mmultiline:true,validType:'length[0,150]'" style="height:60px;width: 280px;"></input></td>
			</tr>

	        <tr>
	            <td>图片链接:</td>
	            <td><input class="easyui-textbox" name="picture" data-options="mmultiline:true,validType:'length[0,150]'" style="height:60px;width: 280px;"></input></td>
	        </tr>

	        <%--<tr>--%>
	            <%--<td>商品图片:</td>--%>
	            <%--<td>--%>
	            	 <%--<a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">上传图片</a>--%>
	                 <%--<input type="hidden" name="image"/>--%>
	            <%--</td>--%>
	        <%--</tr>--%>
	        <%--<tr>--%>
	            <%--<td>商品描述:</td>--%>
	            <%--<td>--%>
	                <%--<textarea style="width:800px;height:300px;visibility:hidden;" name="desc"></textarea>--%>
	            <%--</td>--%>
	        <%--</tr>--%>
	        <%--<tr class="params hide">--%>
	        	<%--<td>商品规格:</td>--%>
	        	<%--<td>--%>
	        		<%----%>
	        	<%--</td>--%>
	        <%--</tr>--%>
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
//	var itemAddEditor ;
//	//页面初始化完毕后执行此方法
//	$(function(){
//		//创建富文本编辑器
//		itemAddEditor = TAOTAO.createEditor("#itemAddForm [name=desc]");
//		//初始化类目选择和图片上传器
//		TAOTAO.init({fun:function(node){
//			//根据商品的分类id取商品 的规格模板，生成规格信息。第四天内容。
//			//TAOTAO.changeItemParam(node, "itemAddForm");
//		}});
//	});
	//提交表单
	function submitForm(){
		//有效性验证
		if(!$('#itemAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		//取商品价格，单位为“分”
//		$("#itemAddForm [name=price]").val(eval($("#itemAddForm [name=priceView]").val()) * 100);
//		//同步文本框中的商品描述
//		itemAddEditor.sync();
//		//取商品的规格
		/*
		var paramJson = [];
		$("#itemAddForm .params li").each(function(i,e){
			var trs = $(e).find("tr");
			var group = trs.eq(0).text();
			var ps = [];
			for(var i = 1;i<trs.length;i++){
				var tr = trs.eq(i);
				ps.push({
					"k" : $.trim(tr.find("td").eq(0).find("span").text()),
					"v" : $.trim(tr.find("input").val())
				});
			}
			paramJson.push({
				"group" : group,
				"params": ps
			});
		});
		//把json对象转换成字符串
		paramJson = JSON.stringify(paramJson);
		$("#itemAddForm [name=itemParams]").val(paramJson);
		*/
		//ajax的post方式提交表单
		//$("#itemAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("/item/save",$("#itemAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增商品成功!');
			}else {
			    $.messager.alert("error");
			}
		});
	}
	
	function clearForm(){
		$('#itemAddForm').form('reset');
		itemAddEditor.html('');
	}
</script>
