/**
 * 
 */
function getTotalRatingCnt(){
	$.ajax({
		type: "POST",
		url: "/movie/TotalRatingCnt.mv",
		success: function(response){

		},
		error: function(xhr, status, error){
			alert("평가 수 가져오기 실패: " + error);
		}
	});
}
