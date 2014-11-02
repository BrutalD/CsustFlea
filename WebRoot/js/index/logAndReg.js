function register() {
    
		Ext.onReady(function() {
		   var panel1 = new Ext.panel.Panel({
		     width:390, 
		     height:85,
		     html:"<img src='./img/index/reg.jpg'' />"
		   });
		   
           var win1 = new Ext.Window({
              width:400,
              height:500,
              iframe:true,
              closeable:true,
              modal:true,
              draggable:true,
              resizable:false,
              deferredRender:false,
              defaultType:'textfield',
              items:[
                 {xtype:panel1},    
                 {xtype:'form',width:390,height:468,layout:'absolute',id:'regform',items:[
                 {xtype:'panel',height:30,width:100,html:"<div style='font-size:16px;font-family:微软雅黑'>用户名:</div>",baseCls: 'my-panel-no-border',x:15,y:23},
                 {xtype:'textfield',height:30,width:280,x:55,y:58,id:'username',allowBlank : false,blankText : '用户名不能为空！'},
                 {xtype:'panel',height:25,width:100,html:"<div style='font-size:16px;font-family:微软雅黑'>密码:</div>",baseCls: 'my-panel-no-border',x:4,y:105},
                 {xtype:'textfield',height:30,width:280,x:55,y:139,inputType:'password',id:'password',allowBlank : false,blankText : '密码不能为空！'},
                 {xtype:'panel',height:25,width:100,html:"<div style='font-size:16px;font-family:微软雅黑'>确认密码:</div>",baseCls: 'my-panel-no-border',x:20,y:187},
                 {xtype:'textfield',inputType:'password',height:30,width:274,x:55,y:227,allowBlank : false,blankText : '密码不能为空！',id:'password1'},
                 {xtype:'button',height:30,width:280,text:'<font size=3 face=微软雅黑>注册</font>',x:55,y:300,id:'bt1'}
                 ]}
                ]
           });			
           var bt1 = Ext.getCmp('bt1');
           bt1.on('click',function(){
             var usevalue = Ext.getCmp('username').getValue();
             var pwdvalue = Ext.getCmp('password').getValue();
             var pwd1value = Ext.getCmp('password1').getValue();
             if(usevalue.length == 0  || pwdvalue.length == 0 || pwd1value.length == 0){Ext.Msg.alert('温馨提示','您有信息没填完整');}
             else if(usevalue.length < 4 || usevalue.length > 20){Ext.Msg.alert('温馨提示','用户名的长度应该在4到20之间');}
             else if(pwdvalue.length < 4 || pwdvalue.length > 16){Ext.Msg.alert('温馨提示','密码的长度应该在4到16之间');} 
             else if(pwdvalue !=  pwd1value){
                 Ext.Msg.alert('温馨提示','两次输入的密码不同');
             }
             else{
              var requestConfig = {
			  url :'RegUser_smd.action',
			  params : {
			  'user.username' : usevalue,     
			  'user.password' : pwdvalue,   
			},
			callback : function(options,success,response){
			    if(success){
					  var obj = Ext.JSON.decode(response.responseText);
				      var flag = obj.flag;
					  if(flag){
					    Ext.Msg.alert('温馨提示','注册成功，请登录'); 
					    win1.close();
					  }
					  else{
					    Ext.Msg.alert('温馨提示','此用户名已被注册');  
					  }
					}
					else{
					Ext.Msg.alert('温馨提示','注册超时，请重新注册');
					}
			}
		};
              
		Ext.Ajax.request(requestConfig);//发送请求  
             
             }       
           });
           function check(){
              Ext.getCmp('regform').isValid();   
           }
		  win1.show();
		});
	};
    
    function login() {
	    Ext.QuickTips.init();
		Ext.onReady(function() {
		var panel = new Ext.panel.Panel({
		 width:400,
		 height:85,
		 html:"<img src='./img/index/logo1.png' />"
		});
		
		var win = new Ext.Window({
	 	       width:400,
               height:300,
               draggable: true,
               closeable:true,
               resizable:false,
               border:false,
               deferredRender:false,
               iframe:true,
               modal:true,
               items:[
               {xtype:panel},
               {xtype:'tabpanel',
                activeTab:0,
                iframe:true,
                items:[{
                xtype:'form',
                title:'用户登录',
                iframe:true,
                id:'0',
                autoHeight:true,
                layout:'absolute',
                height:155,
                bodyStyle : 'padding-top:27px',
                items:[
                {xtype:'textfield',fieldLabel:'用户名',id:'username',allowBlank : false,blankText : '用户名不能为空！',width:290,cls :'login',x:0,y:24,name:'username'},
                {xtype:'textfield',fieldLabel:'密&nbsp&nbsp&nbsp码',inputType:'password',id:'password',allowBlank : false,blankText : '密码不能为空！',width:290,x:0,y:60,name:'password' 
                },
                {xtype:'button',text:'登录',icon:"./img/index/lock.png",x:200,y:115,id:'bt2'},
                {xtype:'button',text:'重置',icon:"./img/index/arrow_redo.png",x:270,y:115,id:'bt3'}
                ]
                },
                {
                xtype:'form',
                title:'信息通告',
                iframe:true,
                id:'1'
                },
                {
                xtype:'form',
                title:'关于',
                iframe:true,
                id:'2'
                }
                ]
               }
               ]
	});
	
    var bt2 = Ext.getCmp('bt2');
	bt2.on('click',function(){
	    var usevalue = Ext.getCmp('username').getValue();
        var pwdvalue = Ext.getCmp('password').getValue();
	   
	     var requestConfig = {
			url :'LogUser_smd.action',//请求的服务器地址
			//form : 'fm',//指定要提交的表单id
			params : {
			'user.username' : usevalue,     
			'user.password' : pwdvalue,      //获取编辑器的内容
			},
			callback : function(options,success,response){
				 if(success){
				  var obj = Ext.JSON.decode(response.responseText);
			      var flag = obj.flag;
				  if(flag){
				    location.href="myMarket.action";
				  }
				  else{
				    Ext.Msg.alert('温馨提示','用户名与密码不匹配');  
				  }
				}
				else{
				Ext.Msg.alert('温馨提示','登录超时，请重新提交');
				}
			}
		};
           
		Ext.Ajax.request(requestConfig);//发送请求  
	     });	
	
	var bt3 = Ext.getCmp('bt3');
	bt3.on('click',function(){
	   Ext.getCmp('0').getForm().reset(); 
	});
	
	win.show();
	
	});    
	};
	
	
	
