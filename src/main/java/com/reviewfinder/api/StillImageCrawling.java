package com.reviewfinder.api;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class StillImageCrawling {
	
	public String stillImageCrawling(String movieId, String movieSeq) {
		String url = "https://www.kmdb.or.kr/db/kor/detail/movie/"+movieId+"/"+movieSeq+"/own/image#dataHashStillDetail0";
		String still_image = "";
		
		try {
			// 1. Jsoup을 이용해 타겟 HTML 페이지 불러오기
			Document document = Jsoup
					.connect(url).get();

			// 2. li 태그 내에 있는 <span class="mImg1"> 안에 있는 style 속성의 이미지 URL 추출
			Elements listItems = document.select("div.mList8.type3 ul li");

			// 3. 이미지 URL 필터링 및 출력
			for (Element listItem : listItems) {
				// 각 li 태그 안의 a 태그 안에 <span class="mImg1"> 태그의 style 속성 추출
				Element spanMImg1 = listItem.selectFirst("a span.mImg1 span[style]");

				if (spanMImg1 != null) {
					// style 속성에서 이미지 URL 추출
					String style = spanMImg1.attr("style");
					String imageUrl = style.substring(style.indexOf("url(") + 4, style.indexOf(")")).replace("\"", "");

					// "poster"가 포함되지 않은 URL만 출력 ("still" URL만)
					if (imageUrl.contains("still")) {
						// 앞뒤 '' 제거 후 출력
						imageUrl = imageUrl.replace("'", "");
						still_image = still_image+imageUrl+"|";
//						System.out.println(imageUrl);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return still_image;
	}
	
}
