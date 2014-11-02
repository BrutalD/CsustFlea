/*
Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function(config) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';

	config.language = 'zh-cn';
	config.filebrowserBrowseUrl = '../../../CsustFlea/ckeditor/uploader/browse.jsp';
	config.filebrowserImageBrowseUrl = '../../../CsustFlea/ckeditor/uploader/browse.jsp?type=Images';
	config.filebrowserUploadUrl = '../../../CsustFlea/ckeditor/uploader/upload.jsp';                       //上传处理的jsp
	config.filebrowserImageUploadUrl = '../../../CsustFlea/ckeditor/uploader/upload.jsp?type=Images';      //传图片
	config.uiColor = '#CECCC4'; //背景颜色     
	config.resize_enabled = false;
	
	//工具栏     
	config.toolbar = [ [ 'Source', 'Bold', 'Italic' ],
			[ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ],
			[ 'Smiley' ], [  'Font', 'FontSize' ], [ 'TextColor' ],
			[ 'Undo', 'Redo' , 'Preview'],['Image','Table', 'HorizontalRule', 'SpecialChar','Link',],
			['NumberedList', 'BulletedList'],
			['Subscript', 'Superscript']
	];
	
	

};

