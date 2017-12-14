
function getPompiers(categChoisie){
	$.ajax({
                type:"POST",
                url : "alertesServlet",
		cache : false,
		data : "nCaserne="+$("#id"),
		datatype : "html",
		success : function(html){
			
                    var info = nCaserne;
                    $('#test').append(info);
		} 
	});

}

