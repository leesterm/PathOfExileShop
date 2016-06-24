$(document).ready(function(){
	//User functionality
	var prefix = 1;
	var suffix = 1;
	
	$('#item').on('change',function(){	getItemInfo()});
	$('#prefix1').on('change',function(){	getPrefixInfo(1);});
	$('#prefix2').on('change',function(){	getPrefixInfo(2);});
	$('#prefix3').on('change',function(){	getPrefixInfo(3);});
	$('#suffix1').on('change',function(){	getSuffixInfo(1);});
	$('#suffix2').on('change',function(){	getSuffixInfo(2);});
	$('#suffix3').on('change',function(){	getSuffixInfo(3);});
	
	$('#addPrefix').click(function(){
		if(prefix <3){
			$.ajax({
				type:"GET",
				url:"/user/prefixes/",
				success:function(data){
					prefix++;
					$('#prefix'+prefix).show();
					for(a in data){
						$('#prefix'+prefix).append("<option>"+data[a]['name']+"</option>");
					}
					getPrefixInfo(prefix);
				},
				error:function(err){
					alert("Failed to query prefixes");
				}
			})
		}
		else
			alert("Only 3 prefixes/3suffixes per item");
	})
	$('#addSuffix').click(function(){
		if(suffix <3){
			$.ajax({
				type:"GET",
				url:"/user/suffixes/",
				success:function(data){
					suffix++;
					$('#suffix'+suffix).show();
					for(s in data){
						$('#suffix'+suffix).append("<option>"+data[s]['name']+"</option>");
					}
					getSuffixInfo(suffix);
				},
				error:function(err){
					alert("Failed to query suffixes");
				}
			})
		}
		else
			alert("Only 3 prefixes/3suffixes per item");
	})

	function getItemInfo(){	
		$.ajax({
			type:"GET",
			url:"/user/item/?name="+document.getElementById('item').value,
			success:function(res){
				$('#item-img').attr('src',"/images/"+res.item_image);
				//$('#item-info').html("<h2>"+res.item_name+"</h2>");
			},
			error:function(err){
				alert("Image not found");
			}
		})
	}
	function getPrefixInfo(i){
		$.ajax({
			type:"GET",
			url:"/user/prefix/?name="+document.getElementById('prefix'+i).value,
			success:function(res){
				$('#prefix-info-'+i).html(res[0].description);
			},
			error:function(err){
				alert("Prefix info not found");
			}
		})
	}
	function getSuffixInfo(i){
		$.ajax({
			type:"GET",
			url:"/user/suffix/?name="+document.getElementById('suffix'+i).value,
			success:function(res){
				$('#suffix-info-'+i).html(res[0].description);
			},
			error:function(err){
				alert("Suffix info not found");
			}
		})
	}
	getItemInfo();
	getPrefixInfo(1);
	getSuffixInfo(1);
})