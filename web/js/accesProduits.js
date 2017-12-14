
function getPompiers(categChoisie){
	$.ajax({
                type:"POST",
                url : "alertes",
		cache : false,
		data : "nCaserne="+ categChoisie,
		datatype : "html",
		success : function(html){
                    $('#listePompiers').append(html);
		} 
	});

}

//function getListe(categChoisie){
//	$.ajax({
//                type:"POST",
//                url : "alertes",
//		cache : false,
//		data : "selectPompier=" + document.getElementById("pompier").value,
//		datatype : "html",
//		success : function(html){
//                    $('#tableauPompier').append(html);
//		} 
//	});
//
//}
